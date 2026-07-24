New-Item .gitignoreimport pandas as pd
from sqlalchemy import create_engine
from urllib.parse import quote_plus

username = "postgres"
password = quote_plus("Postgres@123")   # safely encodes the @ symbol
host = "localhost"
port = "5432"
database = "data_warehouse_project"

engine = create_engine(f"postgresql://{username}:{password}@{host}:{port}/{database}")

query = "SELECT * FROM gold.fact_sales LIMIT 10;"
df = pd.read_sql(query, engine)
print(df.shape)
print(df.head())
