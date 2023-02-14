/*
  Warnings:

  - The primary key for the `Clinica` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `Clinica` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Clinica" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
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
INSERT INTO "new_Clinica" ("active", "address", "city", "cnpj", "contact", "created_at", "id", "name", "state", "update_at", "userId") SELECT "active", "address", "city", "cnpj", "contact", "created_at", "id", "name", "state", "update_at", "userId" FROM "Clinica";
DROP TABLE "Clinica";
ALTER TABLE "new_Clinica" RENAME TO "Clinica";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
