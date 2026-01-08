const express = require("express");
const mysql = require("mysql");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "studentdb"
});

db.connect();

app.post("/student", (req, res) => {
    const { name, email } = req.body;

    db.query(
        "INSERT INTO students (name, email) VALUES (?, ?)",
        [name, email],
        () => res.send("Student stored in database")
    );
});

app.listen(3000);