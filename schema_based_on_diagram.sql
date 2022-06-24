CREATE TABLE patients(
   patient_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
   name  VARCHAR(120)  NOT NULL,
   date_of_birth DATE
);

CREATE TABLE medical_histories(
   medical_history_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
   admitted_at  TIMESTAMP  NOT NULL,
   status VARCHAR(120)     NOT null,
   FOREIGN KEY (medical_history_id) REFERENCES patients(patient_id),
   FOREIGN KEY (medical_history_id) REFERENCES treatments(treatment_id),
);


CREATE TABLE treatments(
   treatment_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
   type   VARCHAR(120)  NOT NULL,
   name   VARCHAR(120)  NOT NULL,
   FOREIGN KEY (treatment_id) REFERENCES medical_histories(medical_history_id),
);


CREATE TABLE invoice_items(
   invoice_items_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
   unit_price  DECIMAL  NOT NULL,
   quantity      INT    NOT NULL,
   total_price   INT    NOT NULL,
   invoice_id    INT    NOT NULL,
   treatment_id  INT     NOT NULL,
   FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id),
   FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id)
);


CREATE TABLE invoices(
   invoice_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
   total_amount  DECIMAL  NOT NULL,
   generated_at  TIMESTAMP,
   payed_at      TIMESTAMP,
   medical_history_id   INT,
   FOREIGN KEY (medical_history_id) REFERENCES medical_histories(medical_history_id)
);



