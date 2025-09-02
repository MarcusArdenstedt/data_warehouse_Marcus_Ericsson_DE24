import dlt 
import requests
import json
from constant import API_KEY
from pathlib import Path
import os



def parkings(url, params):
    respones = requests.get(url, params= params)
    respones.raise_for_status()
    return json.loads(respones.content.decode("utf8"))

@dlt.resource(write_disposition="replace")
def parking_resource(params):
    
    url = "https://openparking.stockholm.se/LTF-Tolken/v1/servicedagar/all"  # tog bort ?, om det inte funkar kan det vara därför
    
    for parking in parkings(url, params).get("features", []):
        yield parking
        
def run_pipeline(table_name):
    pipeline = dlt.pipeline(pipeline_name="st_parking", destination= "snowflake", dataset_name= "staging")
    
    params = {
    "maxFeatures": 100,
    "outputFormat": "json",
    "apikey": API_KEY}
    
    load_info = pipeline.run(parking_resource(params), table_name= table_name)
    print(load_info)
    
    
if __name__ == "__main__":
    working_directory = Path(__file__).parent
    os.chdir(working_directory)
    
    table_name = "stockholms_parkering"
    
    run_pipeline(table_name)