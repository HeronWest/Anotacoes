CREATE TABLE IF NOT EXISTS pastas(
    id          INTEGER PRIMARY KEY autoincrement,
    nome        TEXT,
    cor         TEXT
);

CREATE TABLE IF NOT EXISTS anotacoes(
    pasta                   INTEGER,
    id                      INTEGER PRIMARY KEY autoincrement,
    titulo                  TEXT,
    descricao               TEXT

);
