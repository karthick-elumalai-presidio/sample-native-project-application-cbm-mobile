import { DarkTheme, DefaultTheme, type Theme } from "@react-navigation/native";

export const THEME = {
  light: {
    background: "#EFF6FF",
    foreground: "#000000",
    card: "#FFFFFF",
    cardForeground: "#000000",
    popover: "#FFFFFF",
    popoverForeground: "#000000",
    primary: "#0046AD",
    primaryForeground: "#FFFFFF",
    secondary: "#DBE9FE",
    secondaryForeground: "#62748E",
    muted: "#DBE9FE",
    mutedForeground: "#62748E",
    accent: "#007BFF",
    accentForeground: "#FFFFFF",
    destructive: "#FF4C4C",
    border: "#C5D9F2",
    input: "#C5D9F2",
    ring: "#0046AD",
    chart1: "#0046AD",
    chart2: "#007BFF",
    chart3: "#00BFFF",
    chart4: "#87CEEB",
    chart5: "#B0E0E6"
  },
  dark: {
    background: "#0A0A0A",
    foreground: "#FFFFFF",
    card: "#1A1A1A",
    cardForeground: "#FFFFFF",
    popover: "#1A1A1A",
    popoverForeground: "#FFFFFF",
    primary: "#0046AD",
    primaryForeground: "#FFFFFF",
    secondary: "#1A1A1A",
    secondaryForeground: "#A0A0A0",
    muted: "#1A1A1A",
    mutedForeground: "#A0A0A0",
    accent: "#007BFF",
    accentForeground: "#FFFFFF",
    destructive: "#FF4C4C",
    border: "#2A2A2A",
    input: "#2A2A2A",
    ring: "#0046AD",
    chart1: "#0046AD",
    chart2: "#007BFF",
    chart3: "#00BFFF",
    chart4: "#87CEEB",
    chart5: "#B0E0E6",
    black: "#000000"
  }
};

export const lightTheme: Theme = {
  ...DefaultTheme,
  colors: {
    ...DefaultTheme.colors,
    primary: THEME.light.primary,
    background: THEME.light.background,
    card: THEME.light.card,
    text: THEME.light.foreground,
    border: THEME.light.border,
    notification: THEME.light.destructive
  }
};

export const darkTheme: Theme = {
  ...DarkTheme,
  colors: {
    ...DarkTheme.colors,
    primary: THEME.dark.primary,
    background: THEME.dark.background,
    card: THEME.dark.card,
    text: THEME.dark.foreground,
    border: THEME.dark.border,
    notification: THEME.dark.destructive
  }
};

export const NAV_THEME = {
  light: lightTheme,
  dark: darkTheme
};