const express = require("express");
const cors = require("cors");
const path = require("path");

const app = express();

app.use(express.json());
app.use(cors());

// Servir arquivos estáticos do frontend
app.use(express.static(path.join(__dirname, "../frontend")));

// Rota inicial para teste backend
app.get("/api", (req, res) => {
  res.json({ message: "Backend funcionando!" });
});

// Qualquer outra rota, retorna index.html (para SPA)
app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname, "../frontend/index.html"));
});

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log("Servidor backend rodando na porta " + PORT);
});
