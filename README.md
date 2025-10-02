# 🌍 Flood Risk Mapping with AWS (Terraform IaC)

This project provisions a **data lake and ETL pipeline on AWS** using **Terraform**.  
The workflow is designed as a foundation for flood risk mapping and geospatial analysis.  

## 🚀 Architecture Workflow
1. **S3 Data Bucket** – Stores raw and processed datasets.  
2. **Glue Crawler** – Automatically crawls S3 data and creates metadata tables in the Glue Data Catalog.  
3. **Glue ETL Job** – Python script that transforms raw data into an analysis-ready format.  
4. **Athena Workgroup** – Executes SQL queries against the processed datasets.  
5. **S3 Results Bucket** – Stores query results for downstream use (dashboards, BI tools, ML models).  

<p align="center">
  <img src="https://github.com/rache3/flood-risk-mapping-aws-etl/blob/main/FRM_Simple_ETL_Architectural%20Diagram.png"/>
</p>

## 📂 Project Structure
├── main.tf # Core Terraform configuration
├── s3.tf # S3 data + results buckets
├── glue.tf # Glue database, ETL job, and crawler
├── athena.tf # Athena workgroup setup
├── iam.tf # IAM role + policies for Glue & Athena
├── etl/
│ └── flood_etl.py # Python ETL script (placeholder/demo)
└── architecture.png # AWS Architecture diagram
