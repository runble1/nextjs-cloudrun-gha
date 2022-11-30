# Prisma
- https://numb86-tech.hatenablog.com/entry/2022/03/26/180052
- https://www.prisma.io/docs/concepts/components/prisma-schema#prisma-schema-file-location

## Usage
Prisma プロジェクト作成
```
npx yarn init -y
npx yarn add -D typescript ts-node-dev prisma
npx yarn run prisma init
```
接続情報
```
vi .env
```
デプロイ
```
npx yarn run prisma migrate dev --name init
```
接続
```
npx prisma studio
```
