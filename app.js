const express = require('express');
const mysql = require('mysql');
const app = express();
const port = 3000;

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'pizza'
});

connection.connect((err) => {
  if (err) throw err;
  console.log('Connected to database');
});

app.use(express.json());

app.get('/api/pizzas', (req, res) => {
  connection.query('SELECT * FROM pizza', (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

app.get('/api/pizzas/:id', (req, res) => {
  const pizzaId = req.params.id;
  connection.query('SELECT * FROM pizza WHERE id = ?', [pizzaId], (err, results) => {
    if (err) throw err;
    if (results.length === 0) {
      res.status(404).send('Pizza not found');
    } else {
      res.json(results[0]);
    }
  });
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});