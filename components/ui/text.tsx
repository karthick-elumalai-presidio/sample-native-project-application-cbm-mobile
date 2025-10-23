import { cn } from "@/lib/utils";
import { cva, type VariantProps } from "class-variance-authority";
import * as React from "react";
import { Platform, Text as RNText, type Role } from "react-native";

const TextClassContext = React.createContext<string | undefined>(undefined);

const textVariants = cva(
  cn(
    "text-foreground text-base",
    Platform.select({
      web: "select-text"
    })
  ),
  {
    variants: {
      variant: {
        default: "",
        h1: cn(
          "text-center text-4xl font-extrabold tracking-tight",
          Platform.select({ web: "scroll-m-20 text-balance" })
        ),
        h2: cn(
          "border-border border-b pb-2 text-3xl font-semibold tracking-tight",
          Platform.select({ web: "scroll-m-20 first:mt-0" })
        ),
        h3: cn(
          "text-2xl font-semibold tracking-tight",
          Platform.select({ web: "scroll-m-20" })
        ),
        h4: cn(
          "text-xl font-semibold tracking-tight",
          Platform.select({ web: "scroll-m-20" })
        ),
        h5: cn(
          "text-lg font-semibold tracking-tight",
          Platform.select({ web: "scroll-m-20" })
        ),
        h6: cn(
          "text-base font-semibold tracking-tight",
          Platform.select({ web: "scroll-m-20" })
        ),
        p: "",
        blockquote: "border-border border-l-2 pl-6 italic",
        list: "my-6 ml-6 list-disc [&>li]:mt-2",
        inlineCode: "bg-muted relative rounded px-[0.3rem] py-[0.2rem] font-mono text-sm font-semibold",
        lead: "text-xl text-muted-foreground",
        large: "text-lg font-semibold",
        small: "text-sm font-medium leading-none",
        muted: "text-sm text-muted-foreground"
      },
      size: {
        default: "",
        xs: "text-xs",
        sm: "text-sm",
        base: "text-base",
        lg: "text-lg",
        xl: "text-xl",
        "2xl": "text-2xl",
        "3xl": "text-3xl",
        "4xl": "text-4xl"
      }
    },
    defaultVariants: {
      variant: "default",
      size: "default"
    }
  }
);

type TextProps = React.ComponentProps<typeof RNText> &
  VariantProps<typeof textVariants> & {
    role?: Role;
  };

const Text = React.forwardRef<React.ElementRef<typeof RNText>, TextProps>(
  ({ className, variant, size, role, ...props }, ref) => {
    const textClass = React.useContext(TextClassContext);
    return (
      <RNText
        ref={ref}
        className={cn(textVariants({ variant, size }), textClass, className)}
        role={role}
        {...props}
      />
    );
  }
);

Text.displayName = "Text";

export { Text, TextClassContext, textVariants };
export type { TextProps };