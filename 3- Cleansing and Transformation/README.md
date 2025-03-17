# 📄 Step 3: Data Cleansing & Transformation Documentation - CASEN 2022 Socioeconomic Analysis

### 🔹 Overview

This document outlines the steps performed to transform the original **CASEN 2022 STATA dataset** into a clean, structured CSV dataset ready for visualization.

### 🛠 Tools Used

• **RStudio:** Conversion from STATA (.dta) format to CSV

• **PostgreSQL:** Initial exploratory analysis and data validation

• **Python (Google Colab):** Filtering and selecting relevant columns for final CSV preparation

### 📂 1. Initial Data Conversion (.dta → .csv)

📌 R Script

```
install.packages("haven")  # For STATA files
install.packages("data.table")  # Efficient data handling
library(haven)
library(data.table)

# Define file path
ruta_archivo <- "C:/Users/fabri/Desktop/Base de datos Casen 2022 STATA_18 marzo 2024.dta"

# Load STATA file
df <- read_dta(ruta_archivo)

# Export dataset to CSV
fwrite(df, "C:/Users/fabri/Desktop/casen_2022.csv", sep = ",")
```
✅ **Output:** Complete CASEN 2022 dataset exported to CSV (```casen_2022.csv```).

### 🔍 2. Exploratory Data Analysis in PostgreSQL

📌 SQL Queries for Data Validation
```
-- Table creation
CREATE TABLE casen (
    id_vivienda INT NOT NULL,
    folio INT NOT NULL,
    id_persona INT NOT NULL,
    region INT NOT NULL,
    area INT NOT NULL,
    edad INT NOT NULL,
    sexo INT NOT NULL,
    yoprcor DECIMAL(15,2),
    ten_viv INT NOT NULL,
    activ DECIMAL(5,2),
    pobreza DECIMAL(5,2)
);

-- Table for income analysis (only active population with valid income)
DROP TABLE IF EXISTS casen_ingresos;
CREATE TABLE casen_ingresos AS
SELECT * FROM casen
WHERE activ = 1 AND yoprcor IS NOT NULL;

-- Table for poverty analysis
DROP TABLE IF EXISTS casen_pobreza;
CREATE TABLE casen_pobreza AS
SELECT * FROM casen
WHERE pobreza IS NOT NULL;
```
✅ **Validated:** Data checked for nulls, duplicates, and inconsistencies.

### 🐍 3. Filtering & Column Selection (Python - Google Colab)

📌 Python Script
```
from google.colab import drive
import pandas as pd
from google.colab import files

# Mount Google Drive
drive.mount('/content/drive')

# Path to CSV
csv_path = "/content/drive/MyDrive/Dataset STATA/casen_2022.csv"

# Columns selected for analysis
columns_needed = [
    'id_vivienda', 'folio', 'id_persona', 'region', 'area',
    'edad', 'sexo', 'yoprcor', 'ten_viv', 'activ', 'pobreza'
]

# Load data with selected columns
df = pd.read_csv(csv_path, usecols=columns_needed)

# Convert columns to correct data types
int_columns = ['id_vivienda', 'folio', 'id_persona', 'region', 'area', 'edad', 'sexo', 'ten_viv', 'activ', 'pobreza']
df[int_columns] = df[int_columns].apply(pd.to_numeric, errors='coerce').astype(pd.Int64Dtype())

# Clean 'yoprcor' (income) column
df['yoprcor'] = pd.to_numeric(df['yoprcor'], errors='coerce').astype(pd.Int64Dtype())

# Save cleaned CSV
csv_filtered_path = "/content/casen_2022_filtered.csv"
df.to_csv(csv_filtered_path, index=False, sep=',', na_rep='')

# Download cleaned CSV
files.download(csv_filtered_path)
```
✅ **Output:** Filtered dataset (casen_2022_filtered.csv) ready for visualization.

### 📁 Processed CSV for Visualization

```
casen_2022_filtered.csv
```

### ✅ Conclusion & Next Steps

• Successfully converted original STATA data to CSV.

• Validated and cleansed data using SQL.

• Filtered and structured data ready for visualization.

🔜 **Next Step:** 
Proceed to ```4- Data Visualization (Power BI)``` 


