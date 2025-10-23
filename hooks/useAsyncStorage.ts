import { useState, useEffect, useCallback } from "react";
import { storage } from "@/utils/asyncStorage";

export function useAsyncStorage<T>(key: string, initialValue: T) {
  const [storedValue, setStoredValue] = useState<T>(initialValue);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const loadValue = async () => {
      const value = await storage.getItem<T>(key);
      if (value !== null) {
        setStoredValue(value);
      }
      setIsLoading(false);
    };

    loadValue();
  }, [key]);

  const setValue = useCallback(
    async (value: T | ((val: T) => T)) => {
      try {
        const valueToStore =
          value instanceof Function ? value(storedValue) : value;
        setStoredValue(valueToStore);
        await storage.setItem(key, valueToStore);
      } catch (error) {
        console.error(`Error setting value for key ${key}:`, error);
      }
    },
    [key, storedValue],
  );

  return [storedValue, setValue, isLoading] as const;
}
