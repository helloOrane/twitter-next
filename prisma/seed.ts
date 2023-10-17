import { PrismaClient } from '@prisma/client'
import { faker } from '@faker-js/faker';


const prisma = new PrismaClient()

async function main() {
  const usersPromise = [];
    for(let i = 0; i < 10; i++) {
        const user = {
            name: faker.person.fullName(),
            emailVerified:faker.date.recent(),
            image: faker.image.avatar(),
            username: faker.internet.userName(),
            displayName: faker.name.firstName(),
            bio: faker.person.bio(),
            location: faker.location.streetAddress(),
            email: faker.internet.email(),
        };
        usersPromise.push(prisma.user.create({data: user}))     
    }
    const users = await Promise.all(usersPromise);
    const tweetsPromises = [];
    const randomNumber = faker.datatype.number({
        min: 0,
        max: users.length - 1,
      });
      const randomWorldCount = faker.datatype.number({
        min: 5,
        max: 12,
      });
    for (let i = 0; i < 100; i++) {
        const tweet = {
            content: faker.lorem.sentence(randomWorldCount),
            userId: users[randomNumber].id,
        };
        tweetsPromises.push(prisma.tweet.create({data: tweet}))
    }
    await Promise.all(tweetsPromises);
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })