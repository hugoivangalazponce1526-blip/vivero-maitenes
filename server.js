const express = require('express');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

app.get('/health', (_req, res) => {
  res.json({ status: 'ok' });
});

app.use(express.static(path.join(__dirname)));

app.listen(PORT, () => {
  console.log(`Vivero Maitenes — servidor en puerto ${PORT}`);
});
