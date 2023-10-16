-- CreateTable
CREATE TABLE "UserFollower" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "followerId" TEXT NOT NULL,
    "followingId" TEXT NOT NULL,
    CONSTRAINT "UserFollower_followerId_fkey" FOREIGN KEY ("followerId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "UserFollower_followingId_fkey" FOREIGN KEY ("followingId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT,
    "emailVerified" DATETIME,
    "image" TEXT,
    "username" TEXT,
    "displayName" TEXT,
    "bio" TEXT,
    "location" TEXT,
    "email" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Tweet" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "content" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT NOT NULL,
    "tweetId" TEXT,
    CONSTRAINT "Tweet_tweetId_fkey" FOREIGN KEY ("tweetId") REFERENCES "Tweet" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Tweet_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "TweetOnLike" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "tweetId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    CONSTRAINT "TweetOnLike_tweetId_fkey" FOREIGN KEY ("tweetId") REFERENCES "Tweet" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "TweetOnLike_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "UserFollower_followerId_followingId_key" ON "UserFollower"("followerId", "followingId");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "TweetOnLike_tweetId_userId_key" ON "TweetOnLike"("tweetId", "userId");
