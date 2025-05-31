import pandas as pd
from sqlalchemy import create_engine

# Read the cleaned data
df = pd.read_csv("C:/Project/DA Project/mentalhealth_dataset_cleaned.csv")

# Database connection configuration
host = "localhost"           
port = 3306                  
user = "root"       
password = "12345"   
database = "Mental_health"   
table_name = "mental_health" 

# Create a database engine
engine = create_engine(f"mysql+pymysql://{user}:{password}@{host}:{port}/{database}")

# Write data
df.to_sql(name=table_name, con=engine, if_exists='replace', index=False)

print("✅ Successfully imported data to the MySQL table: ", table_name)