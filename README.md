# Credit Card Customer Analytics

This project is a comprehensive Python and SQL-based data analysis pipeline designed to process, clean, and analyze credit card customer data and their transactions. It demonstrates data engineering principles including data generation, cleaning, preprocessing, and database schema creation using PostgreSQL.

## Features

- **Data Generation (`generate_transactions.py`)**: Generates a realistic but messy dataset of customer transactions (including missing values, negative amounts, and duplicates) to simulate real-world data engineering challenges.
- **Data Cleaning (`customer_cleaning.py`, `Transactions_cleaning.py`)**: 
  - Cleans and formats raw customer demographic data.
  - Cleans transaction data by handling nulls, removing duplicates, and extracting useful time-series features (month, weekday, day).
- **Database Initialization (`DB_creation.py`)**: Automates the creation of a PostgreSQL database (`credit_analysis`) using `psycopg2`.
- **Table Management (`Table_Creation.py`)**: Prepares connections and pandas DataFrames for bulk loading data into the PostgreSQL database.

## Technologies Used
- **Python 3**
- **Pandas & NumPy**: For robust data manipulation and cleaning.
- **PostgreSQL**: For storing and querying the relational data.
- **psycopg2**: PostgreSQL database adapter for Python.

## Project Files Description
- `Credit_card.csv` / `transactions_raw.csv`: Raw, unprocessed data files.
- `Clean_Customer.csv` / `Clean_Transaction.csv`: Cleaned datasets ready for database insertion or analysis.
- `generate_transactions.py`: Script to generate mock transaction data for existing customers.
- `customer_cleaning.py`: Script to clean the raw credit card customer data.
- `Transactions_cleaning.py`: Script to clean the raw transaction data.
- `DB_creation.py`: Script to initialize the PostgreSQL database.
- `Table_Creation.py`: Script for establishing database connections and reading data for table creation.

## Setup Instructions

### Prerequisites
1. Python 3.8+ installed on your machine.
2. PostgreSQL installed and running locally on port `5432`.

### Installation
1. Clone the repository:
   ```bash
   git clone <your-repository-url>
   cd "Credit Card Customer Analytics"
   ```

2. Create a virtual environment and activate it:
   ```bash
   python -m venv .venv
   # On Windows:
   .venv\Scripts\activate
   # On macOS/Linux:
   source .venv/bin/activate
   ```

3. Install the required dependencies:
   ```bash
   pip install pandas numpy psycopg2
   ```

### Usage Workflow

To run the full data pipeline, execute the scripts in the following order:

1. **Generate Data (Optional)**: If you want to regenerate the messy transaction dataset.
   ```bash
   python generate_transactions.py
   ```

2. **Clean the Data**:
   ```bash
   python customer_cleaning.py
   python Transactions_cleaning.py
   ```

3. **Database Setup**:
   *Note: Ensure your PostgreSQL server is running and update the credentials in the script if necessary.*
   ```bash
   python DB_creation.py
   python Table_Creation.py
   ```

## Note to Reviewers
> **Security Note:** The source code currently contains hardcoded PostgreSQL credentials for a local development environment. In a production environment, these would be managed via environment variables or a secure vault.
