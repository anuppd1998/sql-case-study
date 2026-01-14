USE data_bank;

ALTER TABLE customer_nodes
ALTER COLUMN start_date DATE NOT NULL;

ALTER TABLE customer_nodes
ALTER COLUMN end_date DATE NOT NULL;

ALTER TABLE customer_transactions
ALTER COLUMN txn_date DATE NOT NULL;