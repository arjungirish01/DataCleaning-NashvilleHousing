
# Data Cleaning for Nashville Housing Data

This repository contains the code and steps for cleaning and preprocessing the **Nashville Housing Data** using **SQL**, **Jupyter Notebooks**, **Pandas**, **Numpy**, and **Matplotlib/Seaborn**. The project involves handling missing values, removing duplicates, adding calculated columns, and preparing the data for analysis and machine learning.

## Project Overview

The project aims to:
- Use **SQL** to remove duplicates, fill missing data, and add calculated columns (e.g., property age, price per square foot).
- Use **Jupyter Notebooks** for exploratory analysis, data visualization, and documenting the data cleaning process.
- Use **Pandas** and **Numpy** for data manipulation and numerical operations.
- Use **Matplotlib/Seaborn** for visualizing the data after cleaning to identify trends and relationships.

## Data Cleaning Steps

### 1. **SQL Data Cleaning**
   - **Remove Duplicates**: SQL queries are used to identify and remove duplicate records from the dataset.
   - **Handle Missing Data**: Missing values are filled using SQL functions like `COALESCE` and `IS NULL`.
   - **Add Calculated Columns**: Columns such as `age_of_property` are created using SQL expressions.

### 2. **Python Data Cleaning**
   - **Missing Data**: Further imputation is handled in Python using Pandas, where necessary.
   - **Feature Engineering**: Additional columns like `price_per_sqft` are calculated.
   - **Normalization**: Scaling and normalizing numerical data in preparation for analysis.

## Project Structure

```
nashville-housing-data-cleaning/
│
├── data/
│   ├── raw_data.csv              # Original dataset (raw)
│   └── cleaned_data.csv          # Cleaned dataset (after preprocessing)
│
├── notebooks/
│   └── data_cleaning_notebook.ipynb   # Jupyter Notebook for data cleaning
│
├── scripts/
│   ├── data_cleaning.py          # Python script for data cleaning
│   ├── sql_queries.sql           # SQL queries for data preprocessing
│
├── README.md                    # This README file
├── requirements.txt              # Python dependencies
└── LICENSE                       # Project license
```

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/arjungirish01/DataCleaning-NashvilleHousing.git
   cd DataCleaning-NashvilleHousing
   ```

2. **Create a virtual environment** (optional):
   ```bash
   python -m venv venv
   source venv/bin/activate  # For macOS/Linux
   venv\Scripts\activate     # For Windows
   ```

3. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

## Usage

### SQL Queries
The SQL queries used for data cleaning (removing duplicates, handling missing values, and adding calculated columns) are available in the `sql_queries.sql` file.

### Jupyter Notebook
Open the `data_cleaning_notebook.ipynb` file in Jupyter Notebook to explore the data, run queries, and visualize the cleaned data.

### Python Script
Run the Python script `data_cleaning.py` to perform additional data cleaning and preprocessing:
```bash
python scripts/data_cleaning.py
```

This script will load the raw dataset, apply SQL and Python-based cleaning, and save the processed data to `data/cleaned_data.csv`.

## Dependencies

- `pandas` - Data manipulation and cleaning
- `numpy` - Numerical operations
- `sqlalchemy` - SQL integration with Python
- `matplotlib` / `seaborn` - Data visualization
- `jupyter` - For running Jupyter Notebooks

To install dependencies, run:
```bash
pip install -r requirements.txt
```

## Contributing

Feel free to submit issues, pull requests, or suggestions. To contribute:
1. Fork the repository
2. Create a new branch (`git checkout -b feature-branch`)
3. Commit your changes (`git commit -am 'Add feature'`)
4. Push to the branch (`git push origin feature-branch`)
5. Open a pull request

## License

## License

This project is licensed under the **GPL License** - see the [LICENSE](LICENSE) file for details.
