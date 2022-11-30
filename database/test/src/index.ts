import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
    const user = await prisma.user.create({
        data: {
            name: "Alice",
        },
    });
    console.log(user); // { id: 1, name: 'Alice' }
}

main()
    .catch((e) => {
        throw e;
    })
    .finally(async () => {
        // データベースとのコネクションを切る
        await prisma.$disconnect();
    });