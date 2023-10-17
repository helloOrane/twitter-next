import { getSession } from "@/lib/auth/nextAuth";
import React from "react";
import { LoginButton, LogoutButton } from "./AuthButton";

export const Header = async () => {
  const session = await getSession();
  return (
    <header>
      <h4>Twitter</h4>
      {session?.user ? <LogoutButton /> : <LoginButton />}
    </header>
  );
};
