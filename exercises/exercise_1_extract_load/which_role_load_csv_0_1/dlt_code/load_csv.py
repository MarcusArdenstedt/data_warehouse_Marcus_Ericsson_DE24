import dlt
import pandas as pd
from pathlib import Path
import os


@dlt.resource(write_disposition= "replace")
def load_excel_resource(file_path: str, **kwargs):
    df = pd.read_excel(file_path, **kwargs)
    yield df
    
    
    
    
    
if __name__ == '__main__':
    working_directory = Path(__file__).parent
    working_directory_data = working_directory.parent / "data" 
    
    
    os.chdir(working_directory)
    
    csv_path = working_directory_data / "iFood.xlsx"
    
    data = load_excel_resource(csv_path)
    
    pipeline = dlt.pipeline(pipeline_name= "marketing", destination= "snowflake", dataset_name= "staging")
    
    load_info = pipeline.run(data, table_name= "ifood_marketing")
    
    print(load_info)
    
    
