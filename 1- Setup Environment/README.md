# 📌 Step 1: Setup Environment

### 🛠 Tools Used

• **R Studio:** To convert .dta (STATA) files to CSV format.

• **PostgreSQL:** Database used for data exploration and analysis.

• **pgAdmin 4:** Interface for managing PostgreSQL databases and executing SQL queries.

• **Python (Google Colab):** Used for filtering columns, data type corrections, and creating a cleaned CSV dataset.

• **Power BI:** Used to create the final dynamic dashboard visualization.

### 📥 Data Conversion (.dta to CSV)

Since the original CASEN dataset provided by the Chilean government was available only in .dta (STATA) format, the first step was converting it to a usable CSV file.

🔹 Steps to Convert Data (Using R Studio):

**1. Install necessary packages:**
```
install.packages("haven")
install.packages("data.table")
```
**2. Load the libraries:**
```
library(haven)
library(data.table)
```
**3. Convert .dta to CSV:**
```
# Path to the original STATA file
ruta_archivo <- "C:/Users/fabri/Desktop/Base de datos Casen 2022 STATA_18 marzo 2024.dta"

# Load the dataset
df <- read_dta(ruta_archivo)

# Export dataset as CSV
fwrite(df, "C:/Users/fabri/Desktop/casen_2022.csv", sep = ",")
```
### 📊 PostgreSQL Database Setup

The CSV file was then imported into PostgreSQL for exploratory analysis.

🔹 **PostgreSQL Table Creation:**
```
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
```
• Data was imported using the pgAdmin Import/Export Data Wizard (CSV).

### 🐍 Python (Google Colab) Setup

A Python script was used to filter necessary columns and correct data types for final CSV processing:

• **Libraries:** Pandas

• **Output:**     **[casen_2022_filtered.csv](../3-%20Cleansing%20and%20Transformation/Processed_CSVs/casen_2022_filtered.csv)**

(See detailed script in **[3- Cleansing and Transformation](../3-%20Cleansing%20and%20Transformation/)**).

### 📈 Power BI Visualization Setup

Final visualization and KPI creation were done using Power BI. The dashboard is presented in Spanish, reflecting the original language and regional context of the CASEN survey dataset.

### 🔗 Next Step

Proceed to 
```2- Business Request + Planning```
 for project context and objectives.
