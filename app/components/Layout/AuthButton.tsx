
"use client";
import React from "react";
import { signIn, signOut } from "next-auth/react";

export const LoginButton = () => {
  return <button onClick={() => signIn()}>Log in</button>;
};
export const LogoutButton = () => {
  return <button onClick={() => signOut()}>Log out</button>;
};
