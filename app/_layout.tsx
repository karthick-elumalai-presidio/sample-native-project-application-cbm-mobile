import "@/global.css";
import Providers from "@/providers/Providers";

import { Stack } from "expo-router";
import "@/i18n";
import { LinearGradient } from "expo-linear-gradient";
import { useColorScheme } from "nativewind";
import { PortalHost } from "@rn-primitives/portal";
import { THEME } from "@/lib/theme";
import { SafeAreaView } from "react-native-safe-area-context";

export default function Layout() {
  const { colorScheme } = useColorScheme();
  return (
    <Providers>
      <SafeAreaView className="flex-1">
        <LinearGradient
          colors={
            colorScheme === "dark"
              ? [THEME.dark.background, THEME.dark.black]
              : [THEME.light.background, THEME.light.background]
          }
          style={{
            position: "absolute",
            top: 0,
            left: 0,
            right: 0,
            bottom: 0
          }}
        />
        <Stack
          screenOptions={{
            headerShown: false,
            contentStyle: { backgroundColor: "transparent" }
          }}
        />
        <PortalHost />
      </SafeAreaView>
    </Providers>
  );
}
