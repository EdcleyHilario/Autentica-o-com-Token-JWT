/*
  Warnings:

  - The primary key for the `Clinica` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `ativo` on the `Clinica` table. All the data in the column will be lost.
  - You are about to drop the column `nome` on the `Clinica` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "User" ADD COLUMN "name" TEXT;

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Clinica" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT,
    "cnpj" TEXT,
    "address" TEXT,
    "state" TEXT,
    "city" TEXT,
    "contact" TEXT,
    "active" BOOLEAN DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_at" DATETIME NOT NULL,
    "userId" TEXT,
    CONSTRAINT "Clinica_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Clinica" ("cnpj", "created_at", "id", "update_at", "userId") SELECT "cnpj", "created_at", "id", "update_at", "userId" FROM "Clinica";
DROP TABLE "Clinica";
ALTER TABLE "new_Clinica" RENAME TO "Clinica";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
