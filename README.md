# Financial Time Series Analysis

This repository contains R scripts for analyzing the relationship between major stock indices (IBOV, SPX, and NASDAQ) using time series techniques. It is the final project for the first-year Macroeconometrics class in the MScE at HEC Lausanne.

## Project Structure

```
financial-time-series-analysis/
│── data/                # Raw data files (CSV)
│── scripts/             # R scripts for data processing and analysis
│   ├── data_preparation.R
│   ├── data_visualization.R
│   ├── descriptive_statistics.R
│   ├── var_model.R
│   ├── svar_model.R
│── results/             # Outputs such as plots and statistics
│   ├── plots/
│   ├── descriptive_statistics.txt
│   ├── var_model_summary.txt
│   ├── var_model_granger.txt
│   ├── svar_model_summary.txt
│── README.md            # Project documentation
│── .gitignore           # Files to be ignored by Git
```

## Installation and Setup

1. Clone this repository:
   ```sh
   git clone https://github.com/seuusuario/financial-time-series-analysis.git
   cd financial-time-series-analysis
   ```
2. Install required R packages:
   ```r
   install.packages(c("dplyr", "tidyverse", "readxl", "lubridate", "ggplot2", "vars", "TSstudio", "urca"))
   ```

## Usage

Run the scripts in the following order:

1. **Data Preparation:**
   ```r
   source("scripts/data_preparation.R")
   ```
2. **Data Visualization:**
   ```r
   source("scripts/data_visualization.R")
   ```
3. **Descriptive Statistics:**
   ```r
   source("scripts/descriptive_statistics.R")
   ```
4. **VAR Model:**
   ```r
   source("scripts/var_model.R")
   ```
5. **SVAR Model:**
   ```r
   source("scripts/svar_model.R")
   ```


## Author
Gabriela Terra

## License
This project is licensed under the MIT License.
