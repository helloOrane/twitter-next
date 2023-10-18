import "./globals.css";
import type { Metadata } from "next";
import Providers from "./providers";
import { Layout } from "./components/Layout/layout";
import React from "react";


export const metadata: Metadata = {
  title: "Twitter Next",
  description: "Generated by create next app",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className="bg-gray-900 text-white">
        <Providers>
          <Layout>{children}</Layout>
        </Providers>
      </body>
    </html>
  );
}
