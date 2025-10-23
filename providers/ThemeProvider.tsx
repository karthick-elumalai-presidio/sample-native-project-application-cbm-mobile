import React, { createContext, useContext, useEffect } from 'react';
import { useColorScheme } from 'react-native';
import { colorScheme } from 'nativewind';
import { useAsyncStorage } from '@/hooks/useAsyncStorage';
import { ThemeProvider as ReactNavigationThemeProvider } from '@react-navigation/native';
import { NAV_THEME } from '@/lib/theme';

type Theme = 'light' | 'dark';

interface ThemeContextType {
  theme: Theme;
  toggleTheme: () => void;
  isDark: boolean;
}

const ThemeContext = createContext<ThemeContextType | undefined>(undefined);

export const ThemeProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const systemTheme = useColorScheme();
  const [theme, setTheme, isLoading] = useAsyncStorage<Theme>('app-theme', systemTheme ?? 'dark');

  useEffect(() => {
    colorScheme.set(theme);
  }, [theme]);

  const toggleTheme = () => {
    const newTheme = theme === 'light' ? 'dark' : 'light';
    setTheme(newTheme);
  };

  const isDark = theme === 'dark';

  if (isLoading) {
    // TODO: Add custom splash screen to accomodate theme
    return null;
  }

  return (
    <ThemeContext.Provider value={{ theme, toggleTheme, isDark }}>
      <ReactNavigationThemeProvider value={NAV_THEME[theme]}>
        {children}
      </ReactNavigationThemeProvider>
    </ThemeContext.Provider>
  );
};

export const useTheme = () => {
  const context = useContext(ThemeContext);
  if (!context) {
    throw new Error('useTheme must be used within ThemeProvider');
  }
  return context;
};
