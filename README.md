# 📊 Socioeconomic Analysis of Chile - CASEN Survey 2022

This repository contains a comprehensive data analysis and visualization project based on the **2022 CASEN (National Socioeconomic Characterization Survey)** conducted in Chile. It aims to provide valuable insights into key socioeconomic indicators, including income, employment, poverty, and housing conditions across different demographics.

### 📌 Project Overview

The CASEN survey is the most important socioeconomic survey in Chile, providing crucial data for public policy decision-making. This project transforms raw survey data into meaningful insights through data cleaning, analysis, and visualization.

### 🚩 Objectives

• Analyze socioeconomic factors such as income levels, employment rates, and housing conditions.

• Identify demographic segments most affected by poverty.

• Deliver insights through an interactive Power BI dashboard.

⚙️ Tools Used

• **R Studio:** Conversion of STATA data (.dta) into CSV.

• **PostgreSQL (pgAdmin):** Data cleaning and exploratory analysis.

• **Python (Colab):** Further data refinement and selection of necessary columns.

• **Power BI:** Creation of a dynamic and interactive dashboard.

### ⚠️ **Important Note on Data File**

Due to the large size of the original dataset (1.61 GB), the raw STATA file (`.dta`) isn't uploaded directly to this GitHub repository. You should download it directly from the official CASEN Survey 2022 website provided by the Ministry of Social Development of Chile:

👉 [**Download CASEN 2022 STATA File (ZIP - 1.61GB)**](https://observatorio.ministeriodesarrollosocial.gob.cl/storage/docs/casen/2022/Base%20de%20datos%20Casen%202022%20STATA_18%20marzo%202024.dta.zip)

Once downloaded, unzip and place the file named `Base de datos Casen 2022 STATA_18 marzo 2024.dta` into the `Data/Raw/` folder of this project, and then follow the data conversion instructions provided in the repository.



### 📁 Repository Structure
```
Radiografia_Socioeconomica_CASEN_2022/
├── 1- Setup Environment/
│   └── README.md
├── 2- Business Request + Planning/
│   └── README.md
├── 3- Cleansing and Transformation/
│   ├── SQL_Queries.sql
│   ├── R_script_dta_to_csv.R
│   ├── Python_script_filter_columns.py
│   ├── Processed_CSV/
│   │   └── casen_2022_filtered.csv
│   └── README.md
├── 4- Data Visualization (Power BI)/
│   ├── Casen_Dashboard.pbix
│   ├── Casen_Dashboard.png
│   └── README.md
├── 5- Putting it All Together/
│   └── README.md
└── Data/
    ├── Raw/
    │   └── Base de datos Casen 2022 STATA_18 marzo 2024.dta
    └── Libro_de_codigos_Base_de_datos_Casen_2022(18marzo2024).xlsx
```
## 📈 Final Dashboard Preview



### 📌 Key Insights

• **Average Income:** CLP $633,000

• **Median Income:** CLP $450,000

• **Occupation Rate:** 51.51%

• **Poverty Rate:** 6.42%

• **Housing Ownership:** 61.09% of individuals reside in owned properties.

### ⚙️ Challenges and Solutions

• **Challenge:** Original data provided in STATA format (.dta), not directly usable for PostgreSQL or Power BI.

• **Solution:** Used R (haven package) for efficient conversion from .dta to CSV.

• **Challenge:** CASEN dataset contained over 90 columns, many irrelevant to project objectives.

• **Solution:** Implemented a Python script in Google Colab to select only essential columns, significantly streamlining data management and analysis.

• **Challenge:** Dataset included null and inconsistent values complicating analysis.

• **Solution:** Conducted thorough exploratory analysis using PostgreSQL to identify, manage, and clean inconsistencies and null values, ensuring data integrity.

### 🚀 Next Steps for Expansion

• Include historical data for trend analysis over multiple years.

• Expand the dashboard with detailed sub-regional (communal) insights.

• Integrate real-time updates as new survey data becomes available.

### 🎯 Impact of the Project

This analysis provides actionable insights that support better-informed social policy decisions, enhancing socioeconomic well-being in Chile.

## 📬 Connect with Me

📩 **Email:** [fabrizio.morasolis@gmail.com](mailto:fabrizio.morasolis@gmail.com)

🔗 **LinkedIn:** [Fabrizio Mora Solis](https://www.linkedin.com/in/fabrizio-mora-solis/)
