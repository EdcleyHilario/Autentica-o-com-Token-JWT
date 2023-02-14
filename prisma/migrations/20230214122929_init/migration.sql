/*
  Warnings:

  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "name" TEXT
);
INSERT INTO "new_User" ("email", "id", "name", "password") SELECT "email", "id", "name", "password" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
CREATE TABLE "new_Clinica" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT,
    "cnpj" TEXT,
    "ativo" BOOLEAN DEFAULT false,
    "userId" TEXT,
    CONSTRAINT "Clinica_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Clinica" ("ativo", "cnpj", "id", "nome", "userId") SELECT "ativo", "cnpj", "id", "nome", "userId" FROM "Clinica";
DROP TABLE "Clinica";
ALTER TABLE "new_Clinica" RENAME TO "Clinica";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
