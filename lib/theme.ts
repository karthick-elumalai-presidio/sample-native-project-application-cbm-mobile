import { DarkTheme, DefaultTheme, type Theme } from '@react-navigation/native';

export const THEME = {
  light: {
    background: '#EFF6FF',
    foreground: '#000000',
    card: '#FFFFFF',
    cardForeground: '#000000',
    popover: '#FFFFFF',
    popoverForeground: '#000000',
    primary: '#0046AD',
    primaryForeground: '#FFFFFF',
    secondary: '#DBE9FE',
    secondaryForeground: '#62748E',
    muted: '#DBE9FE',
    mutedForeground: '#62748E',
    accent: '#007BFF',
    accentForeground: '#FFFFFF',
    destructive: '#FF4C4C',
    border: '#C5D9F2',
    input: '#C5D9F2',
    ring: '#0046AD',
    radius: '0.625rem',
  },
  dark: {
    background: '#0046AD',
    black: '#000000',
    foreground: '#FFFFFF',
    card: '#141414',
    cardForeground: '#FFFFFF',
    popover: '#141414',
    popoverForeground: '#FFFFFF',
    primary: '#007BFF',
    primaryForeground: '#FFFFFF',
    secondary: '#262626',
    secondaryForeground: '#C9C9C9',
    muted: '#262626',
    mutedForeground: '#C9C9C9',
    accent: '#007BFF',
    accentForeground: '#FFFFFF',
    destructive: '#FF4C4C',
    border: '#333333',
    input: '#333333',
    ring: '#007BFF',
    radius: '0.625rem',
  },
};

// Gradient colors for dark mode background
export const GRADIENT_COLORS = {
  dark: {
    start: '#0046AD',
    end: '#000000',
  },
};

export const NAV_THEME: Record<'light' | 'dark', Theme> = {
  light: {
    ...DefaultTheme,
    colors: {
      background: THEME.light.background,
      border: THEME.light.border,
      card: THEME.light.card,
      notification: THEME.light.destructive,
      primary: THEME.light.primary,
      text: THEME.light.foreground,
    },
  },
  dark: {
    ...DarkTheme,
    colors: {
      background: THEME.dark.background,
      border: THEME.dark.border,
      card: THEME.dark.card,
      notification: THEME.dark.destructive,
      primary: THEME.dark.primary,
      text: THEME.dark.foreground,
    },
  },
};
