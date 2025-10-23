import { useTranslation } from "react-i18next";
import { useTheme } from "@/providers/ThemeProvider";
import { Text } from "@/components/ui/text";
import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { View } from "react-native";

export default function Home() {
  const { t } = useTranslation();
  const { toggleTheme, isDark } = useTheme();
  return (
    <View className="p-3">
      <Text className="mb-2 text-center font-bold">{t("welcomeToApp")}</Text>
      <Button className="mb-3" onPress={toggleTheme}>
        <Text>{isDark ? "Switch to Light Mode" : "Switch to Dark Mode"}</Text>
      </Button>
      <Card>
        <CardHeader>
          <CardTitle>Card Title</CardTitle>
          <CardDescription>Card Description</CardDescription>
        </CardHeader>
        <CardContent>
          <Text>Card Content</Text>
          <Input />
        </CardContent>
        <CardFooter>
          <Text>Card Footer</Text>
        </CardFooter>
      </Card>
    </View>
  );
}
