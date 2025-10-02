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


## 🛠️ Prerequisites
- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed  
- AWS CLI configured with sufficient IAM permissions  
- Python 3.x (for ETL scripts)  

## ⚡ Deployment
```bash
terraform init
terraform plan
terraform apply


📊 Demo Data

Currently uses CSV demo data for testing. Can be extended to geospatial data (GeoTIFF, Shapefiles) in future iterations.

🔮 Future Work

Integrate QuickSight dashboards

Add support for geospatial file formats

Automate ingestion of remote sensing datasets (e.g., Sentinel-2, VIIRS)

Author

Rachel Atia – AWS Cloud | GeoAI | Data & Geospatial Analytics
