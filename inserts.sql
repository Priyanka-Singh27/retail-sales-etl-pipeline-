--load csv in staging table
load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_bigmart_data.csv" into table staging_bigmart fields terminated by ',' optionally enclosed by '"' lines terminated by '\n' ignore 1 lines;

INSERT INTO products (Item_Identifier, Item_Weight, Item_Fat_Content, Item_Type) SELECT DISTINCT Item_Identifier, Item_Weight, Item_Fat_Content, Item_Type FROM staging_bigmart;

INSERT INTO outlets (Outlet_Identifier, Outlet_Establishment_Year, Outlet_Size, Outlet_Location_Type, Outlet_Type) SELECT DISTINCT Outlet_Identifier, Outlet_Establishment_Year, Outlet_Size, Outlet_Location_Type, Outlet_Type FROM staging_bigmart;

INSERT INTO sales (Item_Identifier, Outlet_Identifier, Item_Visibility, Item_MRP, Item_Outlet_Sales) SELECT Item_Identifier, Outlet_Identifier, Item_Visibility, Item_MRP, Item_Outlet_Sales FROM staging_bigmart;