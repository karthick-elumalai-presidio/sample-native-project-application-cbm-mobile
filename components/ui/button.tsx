import { TextClassContext } from "@/components/ui/text";
import { cn } from "@/lib/utils";
import { cva, type VariantProps } from "class-variance-authority";
import { Pressable } from "react-native";

const buttonVariants = cva(
  cn("group shrink-0 flex-row items-center justify-center gap-2 rounded-md shadow-none"),
  {
    variants: {
      variant: {
        default: cn("bg-primary shadow-sm shadow-black/5"),
        secondary: cn("bg-white dark:bg-slate-950 shadow-sm shadow-black/5"),
        link: ""
      },
      size: {
        default: cn("h-10 px-4 py-2 sm:h-9"),
        sm: cn("h-9 gap-1.5 rounded-md px-3 sm:h-8"),
        lg: cn("h-11 rounded-md px-6 sm:h-10"),
        icon: "h-10 w-10 sm:h-9 sm:w-9"
      }
    },
    defaultVariants: {
      variant: "default",
      size: "default"
    }
  },
);

const buttonTextVariants = cva(cn("text-foreground text-sm font-medium"), {
  variants: {
    variant: {
      default: "text-primary-foreground",
      secondary: "text-secondary",
      link: cn("text-primary group-active:underline")
    },
    size: {
      default: "",
      sm: "",
      lg: "",
      icon: ""
    }
  },
  defaultVariants: {
    variant: "default",
    size: "default"
  }
});

type ButtonProps = React.ComponentProps<typeof Pressable> &
  React.RefAttributes<typeof Pressable> &
  VariantProps<typeof buttonVariants>;

function Button({ className, variant, size, ...props }: ButtonProps) {
  return (
    <TextClassContext.Provider value={buttonTextVariants({ variant, size })}>
      <Pressable
        className={cn(
          props.disabled && "opacity-50",
          buttonVariants({ variant, size }),
          className
        )}
        role="button"
        {...props}
      />
    </TextClassContext.Provider>
  );
}

export { Button, buttonTextVariants, buttonVariants };
export type { ButtonProps };
