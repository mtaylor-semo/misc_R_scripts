library(ggplot2)

x <- 1L:10
y <- 1L:10
df <- data.frame(x,y)

small_caps <- "S\UE05D\UE051\UE05C\UE05C C\UE051\UE060\UE063"
small_nums <- "\UE020\UE021\UE022\UE023\UE024\UE025\UE026\UE027\UE028\UE029"
  

font <- "Times New Roman"
ggplot(df) +
  geom_point(aes(x = x, y = y)) +
  labs(x = paste("Sᴍᴀʟʟ Cᴀᴘs /", small_caps),
       y = paste("Oʟᴅ Sᴛʏʟᴇ", small_nums)) +
  theme(text = element_text(family = font)) +
  annotate("text", x = 2, y = 9, label = font)

font <- "Linux Libertine O"
ggplot(df) +
  geom_point(aes(x = x, y = y)) +
  labs(x = paste("Sᴍᴀʟʟ Cᴀᴘs /", small_caps),
       y = paste("Oʟᴅ Sᴛʏʟᴇ", small_nums)) +
  theme(text = element_text(family = font)) +
  annotate("text", x = 2, y = 9, label = font)


