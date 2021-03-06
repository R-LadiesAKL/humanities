library(readr)
library(readxl)
library(tidyr)
library(dplyr)

majors <- read_excel("Provider-based-enrolments-predominant-field-of-study-2017-final.xlsx", sheet=8)

majors <- majors %>% 
  select(`Students by field of study (broad, narrow and detailed) and qualification type/level 2008-2017`, 
         X__1, X__2, X__173:X__182, X__233:X__242, X__263:X__272, X__293:X__302)

majors <- majors[-c(1:4),]
majors <- majors[-c(453:465),]


majors[1:39, 1] <- "Natural and physical sciences"
majors[40:61, 1] <- "Information technology"
majors[62:143, 1] <- "Engineering"
majors[144:165, 1] <- "Architecture and building"
majors[166:193, 1] <- "Agriculture and environmental studies"
majors[194:255, 1] <- "Health"
majors[256:276, 1] <- "Education"
majors[277:318, 1] <- "Management and commerce"
majors[319:389, 1] <- "Society and culture"
majors[390:419, 1] <- "Creative arts"
majors[420:432, 1] <- "Food, hospitality and personal services"
majors[433:452, 1] <- "Mixed field programmes"

# Remove totals

majors <- majors[-c(1, 40, 62, 144, 166, 194, 256, 277, 319, 390, 420, 433),]

# Don't need narrow field column

majors <- majors[-2]

# And remove sub-totals

majors <- majors[-c(1, 5, 8, 12, 21, 32, 39, 51, 57, 60, 70, 78, 88, 99, 109, 
                    113, 124, 130, 135, 141, 147, 162, 172, 175, 178, 182, 186, 189, 
                    200, 205, 207, 212, 216, 220, 228, 230, 239, 244, 250, 265, 
                    268, 270, 273, 288, 295, 297, 301, 306, 311, 314, 325, 336, 
                    339, 348, 353, 356, 365, 368, 371, 375, 381, 387, 395, 401, 
                    408, 410, 418, 422, 427, 432, 437, 439, 440),]

majors <- majors %>% 
  rename(Field.of.study=`Students by field of study (broad, narrow and detailed) and qualification type/level 2008-2017`, 
         Major=X__2, 
         `2008.bachelor`=X__173, `2009.bachelor`=X__174, `2010.bachelor`=X__175, `2011.bachelor`=X__176, 
         `2012.bachelor`=X__177, `2013.bachelor`=X__178, `2014.bachelor`=X__179, `2015.bachelor`=X__180, 
         `2016.bachelor`=X__181, `2017.bachelor`=X__182, 
         `2008.hon_pgdip`=X__233, `2009.hon_pgdip`=X__234, `2010.hon_pgdip`=X__235, `2011.hon_pgdip`=X__236, 
         `2012.hon_pgdip`=X__237, `2013.hon_pgdip`=X__238, `2014.hon_pgdip`=X__239, `2015.hon_pgdip`=X__240, 
         `2016.hon_pgdip`=X__241, `2017.hon_pgdip`=X__242, 
         `2008.masters`=X__263, `2009.masters`=X__264, `2010.masters`=X__265, `2011.masters`=X__266, 
         `2012.masters`=X__267, `2013.masters`=X__268, `2014.masters`=X__269, `2015.masters`=X__270, 
         `2016.masters`=X__271, `2017.masters`=X__272, 
         `2008.phd`=X__293, `2009.phd`=X__294, `2010.phd`=X__295, `2011.phd`=X__296, `2012.phd`=X__297, 
         `2013.phd`=X__298, `2014.phd`=X__299, `2015.phd`=X__300, `2016.phd`=X__301, `2017.phd`=X__302)

majors_2008 <- majors[,c(1, 2, 3, 13, 23, 33)]
majors_2009 <- majors[,c(1, 2, 4, 14, 24, 34)]
majors_2010 <- majors[,c(1, 2, 5, 15, 25, 35)]
majors_2011 <- majors[,c(1, 2, 6, 16, 26, 36)]
majors_2012 <- majors[,c(1, 2, 7, 17, 27, 37)]
majors_2013 <- majors[,c(1, 2, 8, 18, 28, 38)]
majors_2014 <- majors[,c(1, 2, 9, 19, 29, 39)]
majors_2015 <- majors[,c(1, 2, 10, 20, 30, 40)]
majors_2016 <- majors[,c(1, 2, 11, 21, 31, 41)]
majors_2017 <- majors[,c(1, 2, 12, 22, 32, 42)]

majors_2008 <- majors_2008 %>% 
  rename(Bachelor=`2008.bachelor`, 
         Hons.PGDip=`2008.hon_pgdip`, 
         Masters=`2008.masters`, 
         PhD=`2008.phd`) %>% 
  gather("Level", "2008 students", 3:6)

majors_2009 <- majors_2009 %>% 
  rename(Bachelor=`2009.bachelor`, 
         Hons.PGDip=`2009.hon_pgdip`, 
         Masters=`2009.masters`, 
         PhD=`2009.phd`) %>% 
  gather("Level", "2009 students", 3:6)

majors_2010 <- majors_2010 %>% 
  rename(Bachelor=`2010.bachelor`, 
         Hons.PGDip=`2010.hon_pgdip`, 
         Masters=`2010.masters`, 
         PhD=`2010.phd`) %>% 
  gather("Level", "2010 students", 3:6)

majors_2011 <- majors_2011 %>% 
  rename(Bachelor=`2011.bachelor`, 
         Hons.PGDip=`2011.hon_pgdip`, 
         Masters=`2011.masters`, 
         PhD=`2011.phd`) %>% 
  gather("Level", "2011 students", 3:6)

majors_2012 <- majors_2012 %>% 
  rename(Bachelor=`2012.bachelor`, 
         Hons.PGDip=`2012.hon_pgdip`, 
         Masters=`2012.masters`, 
         PhD=`2012.phd`) %>% 
  gather("Level", "2012 students", 3:6)

majors_2013 <- majors_2013 %>% 
  rename(Bachelor=`2013.bachelor`, 
         Hons.PGDip=`2013.hon_pgdip`, 
         Masters=`2013.masters`, 
         PhD=`2013.phd`) %>% 
  gather("Level", "2013 students", 3:6)

majors_2014 <- majors_2014 %>% 
  rename(Bachelor=`2014.bachelor`, 
         Hons.PGDip=`2014.hon_pgdip`, 
         Masters=`2014.masters`, 
         PhD=`2014.phd`) %>% 
  gather("Level", "2014 students", 3:6)

majors_2015 <- majors_2015 %>% 
  rename(Bachelor=`2015.bachelor`, 
         Hons.PGDip=`2015.hon_pgdip`, 
         Masters=`2015.masters`, 
         PhD=`2015.phd`) %>% 
  gather("Level", "2015 students", 3:6)

majors_2016 <- majors_2016 %>% 
  rename(Bachelor=`2016.bachelor`, 
         Hons.PGDip=`2016.hon_pgdip`, 
         Masters=`2016.masters`, 
         PhD=`2016.phd`) %>% 
  gather("Level", "2016 students", 3:6)

majors_2017 <- majors_2017 %>% 
  rename(Bachelor=`2017.bachelor`, 
         Hons.PGDip=`2017.hon_pgdip`, 
         Masters=`2017.masters`, 
         PhD=`2017.phd`) %>% 
  gather("Level", "2017 students", 3:6)

majors_tall <- cbind(majors_2008, majors_2009$`2009 students`, majors_2010$`2010 students`, 
              majors_2011$`2011 students`, majors_2012$`2012 students`, majors_2013$`2013 students`, 
              majors_2014$`2014 students`, majors_2015$`2015 students`, majors_2016$`2016 students`, 
              majors_2017$`2017 students`)

majors_tall <- majors_tall %>% 
  rename(`2008`=4, 
         `2009`=5, 
         `2010`=6, 
         `2011`=7, 
         `2012`=8, 
         `2013`=9, 
         `2014`=10, 
         `2015`=11, 
         `2016`=12, 
         `2017`=13)

majors_tall$`2008` <- as.numeric(majors_tall$`2008`)

majors_taller <- majors_tall %>% 
  gather("Year", "Students", 4:13)

majors_summary1 <- majors_taller %>% 
  group_by(Field.of.study) %>% 
  summarise(Students = sum(Students))

majors_summary2 <- majors_taller %>% 
  group_by(Field.of.study, Level, Year) %>% 
  summarise(Students = sum(Students))

majors_summary3 <- majors_taller %>% 
  group_by(Field.of.study, Year) %>% 
  summarise(Students = sum(Students))

humanities_tall <- majors_tall %>% 
  filter(Field.of.study=="Society and culture")

humanities_tall <- humanities_tall %>% 
  select(-Field.of.study) %>% 
  filter(Major %in% c("Political Science", "Policy Studies", "Sociology", "Anthropology", "History", 
                      "Art History", "Archaeology", "Classics", "Human Geography", "Women's Studies", 
                      "Studies in Human Society nec, mixed or nfd", "Behavioural Science nec, mixed or nfd", 
                      "Curatorial Studies", "English Language", "Criminology",
                      "Te Reo Maori", "Foreign Languages", "Linguistics", "Literature", 
                      "Language and Literature nec, mixed or nfd", "Philosophy", "Religious Studies", 
                      "Community, Whanau, Family and Consumer Studies", "Cultural Studies", 
                      "Society and Culture nec, mixed or nfd"))

humanities_taller <- humanities_tall %>% 
  gather("Year", "Students", 3:12)

humanities_summary <- humanities_taller %>% 
  group_by(Major, Year) %>% 
  summarise(Students = sum(Students))

# overall students

total_uni_students <- majors_taller %>% 
  group_by(Year) %>% 
  summarise(Students = sum(Students))

library(ggplot2)

ggplot(humanities_summary, aes(x=Year, y=Students, group=Major)) + 
  geom_line(aes(color=Major)) + 
  theme_minimal() +
  labs(y="Number of students", title="Tertiary students' predominant course of study", 
       caption="Source: educationcounts.govt.nz")

# filter out smaller courses to only include those majors that have had at least 1000 students enrolled in a single year at least once in the last decade

humanities_filtered <- humanities_summary %>%
  filter(max(Students) >= 1500)

ggplot(humanities_filtered, aes(x=Year, y=Students, group=Major)) + 
  geom_line(aes(color=Major)) + 
  theme_minimal() +
  labs(y="Number of students", title="Tertiary students' predominant course of study", 
       caption="Source: educationcounts.govt.nz")
  
humanities_bachelor <- humanities_taller %>% 
  filter(Level=="Bachelor") %>% 
  group_by(Major, Year) %>% 
  summarise(Students = sum(Students)) %>% 
  filter(max(Students) >=500)

ggplot(humanities_bachelor, aes(x=Year, y=Students, group=Major)) + 
  geom_line(aes(color=Major)) + 
  theme_minimal() +
  labs(y="Number of students", title="Degree-level students' predominant course of study", 
       caption="Source: educationcounts.govt.nz")

# slope graph

humanities_slope <- humanities_bachelor %>% 
  filter(Year %in% c("2008", "2017")) %>% 
  filter(max(Students) > 500)

humanities_slope$Year <- as.numeric(humanities_slope$Year)

humanities_slope <- humanities_slope %>% arrange(desc(Students))

humanities_slope$Major <- factor(humanities_slope$Major, 
                                          levels=unique(humanities_slope$Major))

ggplot(humanities_slope, aes(x=Year, y=Students, group=Major)) + 
  geom_line(aes(color=Major), size=1) + 
  theme_minimal() +
  labs(y="Number of students", title="Degree-level students' predominant course of study", 
       caption="Source: educationcounts.govt.nz") + 
  theme(axis.title.y = element_text(vjust=6)) + 
  scale_x_continuous(breaks=seq(2008,2017,9), limits=c(2008,2017)) +
  scale_y_continuous(breaks=seq(0,5000, 1000), limits=c(0,5000)) + 
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_blank(), 
        plot.margin = unit(c(0.5,0.5,0.5,1), "cm"), 
        axis.text.x = element_text(size=10, face = "bold"), 
        axis.text.y = element_text(face = "bold"))

humanities_gap <- humanities_slope %>% 
  spread("Year", "Students") %>% 
  mutate(Gap=`2017`-`2008`) %>% 
  arrange(Gap)

humanities_gap <- humanities_gap %>% 
  mutate(percent_change=Gap/`2008`*100)

humanities_gap$Major <- factor(humanities_gap$Major, levels=unique(humanities_gap$Major))

library(RColorBrewer)
colourCount = length(unique(humanities_gap$Major))

ggplot(humanities_gap, aes(Major, Gap, fill = Major)) + 
  geom_bar(stat = 'identity', position = 'identity') +
  coord_flip() +
  theme_minimal() +
  guides(fill = "none") + 
  labs(y="Change in number of students, 2008 to 2017", title="Degree-level students' predominant course of study", 
       caption="Source: educationcounts.govt.nz") + 
  scale_fill_manual(values = colorRampPalette(brewer.pal(7, "RdGy"))(colourCount)) 
  
# All arts majors

humanities_bachelor_full <- humanities_taller %>% 
  filter(Level=="Bachelor") %>% 
  group_by(Major, Year) %>% 
  summarise(Students = sum(Students))

humanities_gap_full <- humanities_bachelor_full %>% 
  filter(Year %in% c("2008", "2017")) %>% 
  spread("Year", "Students") %>% 
  mutate(Gap=`2017`-`2008`) %>% 
  arrange(Gap)

humanities_gap_full$Major <- factor(humanities_gap_full$Major, levels=unique(humanities_gap_full$Major))

colourCount = length(unique(humanities_gap_full$Major))

ggplot(humanities_gap_full, aes(Major, Gap, fill = Major)) + 
  geom_bar(stat = 'identity', position = 'identity') +
  coord_flip() +
  theme_minimal() +
  guides(fill = "none") + 
  labs(y="Change in number of students, 2008 to 2017", title="Degree-level students' predominant course of study", 
       caption="Source: educationcounts.govt.nz") + 
  scale_fill_manual(values = colorRampPalette(brewer.pal(7, "RdYlGn"))(colourCount)) 

# All levels of study

all_levels <- humanities_taller %>% 
  group_by(Major, Year) %>% 
  summarise(Students = sum(Students)) %>% 
  filter(Year %in% c("2008", "2017")) %>% 
  spread("Year", "Students") %>% 
  mutate(Gap=`2017`-`2008`) %>% 
  filter(!(Major %in% c("Studies in Human Society nec, mixed or nfd", "Behavioural Science nec, mixed or nfd", 
                        "Language and Literature nec, mixed or nfd", "Society and Culture nec, mixed or nfd"))) %>% 
  arrange(Gap)

all_levels <- all_levels %>% 
  mutate(percent_change=Gap/`2008`*100)

all_levels$Major <- factor(all_levels$Major, levels=unique(all_levels$Major))

ggplot(all_levels, aes(Major, Gap, fill = Major)) + 
  geom_bar(stat = 'identity', position = 'identity', color="black") +
  coord_flip() +
  theme_minimal() +
  guides(fill = "none") + 
  labs(y="Change in number of students, 2008 to 2017", title="Students' predominant course of study", 
       caption="Source: educationcounts.govt.nz", subtitle="Degree level or higher") + 
  scale_fill_manual(values = colorRampPalette(brewer.pal(7, "RdGy"))(colourCount)) + 
  scale_y_continuous(breaks=seq(-2000, 2000, 1000), limits=c(-2000,2000)) + 
  theme(panel.grid.minor = element_blank(), 
        plot.margin = unit(c(0.5,1,0.5,1), "cm"), 
        axis.title.y = element_text(vjust=3, face="bold"), 
        axis.title.x = element_text(vjust=-1, face="bold"))

ggsave("change-in-major.png", width=22, height=19, units="cm")

#Top Five +/- change

all_levels_ten <- all_levels %>% 
  filter(Major %in% c("Sociology", "Criminology", "Policy Studies", "Te Reo Maori", 
                      "Anthropology", "Art History", "Religious Studies", "History", 
                      "Literature", "Foreign Languages"))

colourCount = length(unique(all_levels_ten$Major))

ggplot(all_levels_ten, aes(Major, Gap, fill = Major)) + 
  geom_bar(stat = 'identity', position = 'identity', color="black") +
  coord_flip() +
  theme_minimal() +
  guides(fill = "none") + 
  labs(y="Change in number of students, 2008 to 2017", title="Humanities majors: largest changes", 
       caption="Source: educationcounts.govt.nz", subtitle="Degree level or higher") + 
  scale_fill_manual(values = colorRampPalette(brewer.pal(7, "RdGy"))(colourCount)) + 
  scale_y_continuous(breaks=seq(-2000, 2000, 1000), limits=c(-2000,2000)) + 
  theme(panel.grid.minor = element_blank(), 
        plot.margin = unit(c(0.5,1,0.5,1), "cm"), 
        axis.title.y = element_text(vjust=3, face="bold"), 
        axis.title.x = element_text(vjust=-1, face="bold"))
  
ggsave("biggest-change.png", width = 15, height = 14, units = "cm")

# All fields of study

all_fields <- majors_taller %>% 
  group_by(Field.of.study, Year) %>% 
  summarise(Students = sum(Students)) %>% 
  filter(Year%in% c("2008", "2017")) %>% 
  spread("Year", "Students") %>% 
  mutate(Gap = `2017` - `2008`) %>% 
  arrange(Gap)

all_fields$Field.of.study <- factor(all_fields$Field.of.study, levels=unique(all_fields$Field.of.study))

colourCount = length(unique(all_fields$Field.of.study))

ggplot(all_fields, aes(Field.of.study, Gap, fill = Field.of.study)) + 
  geom_bar(stat = 'identity', position = 'identity') +
  coord_flip() +
  theme_minimal() +
  guides(fill = "none") + 
  labs(x="Broad field of study", y="Change in number of students, 2008 to 2017", title="Degree+ students' field of study", 
       caption="Source: educationcounts.govt.nz") + 
  scale_fill_manual(values = colorRampPalette(brewer.pal(7, "RdYlGn"))(colourCount))

# All fields slope graph

all_fields_slope <- all_fields %>% 
  select(-Gap) %>% 
  gather("Year", "Students", 2:3) %>% 
  filter(min(Students) > 1000) %>% 
  arrange(desc(Students))

all_fields_slope$Field.of.study <- factor(all_fields_slope$Field.of.study, levels=unique(all_fields_slope$Field.of.study))

all_fields_slope$Year <- as.numeric(all_fields_slope$Year)

all_fields_slope %>% 
ggplot(aes(x=Year, y=Students, group=Field.of.study)) + 
  geom_line(aes(color=Field.of.study), size=1) + 
  theme_minimal() +
  labs(y="Students enrolled", title="Change in students' broad field of study", 
       subtitle="Bachelor degree level and higher", caption="Source: educationcounts.govt.nz", 
       color="Field of study", size=6) + 
  theme(axis.title.x = element_blank()) + 
  scale_color_manual(values = colorRampPalette(brewer.pal(7, "Reds"))(colourCount)) + 
  theme(axis.title.y = element_text(vjust=6)) + 
  scale_x_continuous(breaks=seq(2008,2017,9), limits=c(2008,2017)) +
  scale_y_continuous(breaks=seq(0,80000,10000), limits=c(0,80000)) + 
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_blank(), 
        plot.margin = unit(c(0.5,0.5,0.5,1), "cm"), 
        axis.text.x = element_text(size=10, face = "bold"), 
        axis.text.y = element_text(face = "bold"), 
        plot.background = element_rect(fill="#B3B3AC", color="#B3B3AC"))

ggsave("all-fields-slope.png", width=15, height=13, units="cm")

## total drop in humanities

humanities_drop <- humanities_taller %>% 
  group_by(Year) %>% 
  summarise(Students = sum(Students)) %>% 
  mutate(previous_year=lag(Students)) %>% 
  mutate(Change=Students-previous_year) %>% 
  select(-previous_year)


ggplot(humanities_drop, aes(x=Year, y=Students, group=1)) + 
  geom_line(color="#ED615A", size=1.5) + 
  theme_minimal() + 
  labs(title="Decline in humanities majors, 2008 - 2017", subtitle="Degree level or higher", 
       caption="Source: educationcounts.govt.nz") + 
  scale_y_continuous(breaks=seq(35000,41000,1000), limits=c(35000,41000)) + 
  theme(panel.grid.minor = element_blank(), 
        panel.grid.major.x = element_blank(), 
        panel.background = element_rect(fill="#B3B3AC", colour = "#B3B3AC"))

ggsave("overall-decline.jpg", width = 20, height = 10, units="cm")

# humanities as proportion of all students

proportion <- left_join(humanities_drop, total_uni_students, by="Year") %>% 
  rename("humanities_students"="Students.x", 
         "all_students"="Students.y") %>% 
  mutate("percent"=(humanities_students/all_students*100))

ggplot(proportion, aes(x=Year, y=percent, group=1)) + 
  geom_line(color="#ED615A", size=1.5) + 
  theme_minimal() + 
  labs(title="Decline in humanities majors, 2008 - 2017", subtitle="Degree level or higher", 
       caption="Source: educationcounts.govt.nz", y="% of all students") + 
  scale_y_continuous(breaks=seq(10,15,1), limits=c(10,15)) + 
  theme(panel.grid.minor = element_blank(), 
        panel.grid.major.x = element_blank(), 
        panel.background = element_rect(fill="#B3B3AC", colour = "#B3B3AC"))

ggsave("humanities-proportion.jpg", width = 20, height = 15, units="cm")

# society and culture as proportion

fields_proportion <- majors_taller %>% 
  filter(Field.of.study=="Society and culture") %>% 
  group_by(Year) %>% 
  summarise(society.and.culture.students=sum(Students))

fields_proportion <- left_join(fields_proportion, total_uni_students, by="Year") %>% 
  mutate("percent"=society.and.culture.students/Students*100)

ggplot(fields_proportion, aes(x=Year, y=percent, group=1)) + 
  geom_line(color="#ED615A", size=1.5) + 
  theme_minimal() + 
  labs(title="Decline in proportion of 'Society and Culture' students, 2008 - 2017", subtitle="Degree level or higher", 
       caption="Source: educationcounts.govt.nz", y="% of all students") + 
  scale_y_continuous(breaks=seq(24,30,1), limits=c(24,30)) + 
  theme(panel.grid.minor = element_blank(), 
        panel.grid.major.x = element_blank(), 
        panel.background = element_rect(fill="#B3B3AC", colour = "#B3B3AC"))

ggsave("society-proportion.jpg", width = 20, height = 15, units="cm")


# combine the two

all_proportion <- left_join(fields_proportion, proportion, by="Year") %>% 
  select(-(c(Change, Students, percent.x, percent.y))) %>% 
  rename(`Total students`=all_students, 
         `Society and Culture students`=society.and.culture.students, 
         `Humanities students`=humanities_students) %>% 
  mutate(`Humanities students`=`Humanities students`/`Total students`*100, 
         `Society and Culture students`=`Society and Culture students`/`Total students`*100, 
         `Total students`=`Total students`/`Total students`*100) %>% 
  mutate(`Total students`=`Total students`-`Society and Culture students`) %>% 
  mutate(`Society and Culture students`=`Society and Culture students`-`Humanities students`)%>% 
  gather("Type", "Count", 2:4) %>% 
  rename(Percent=Count)

all_proportion$Year <- as.numeric(all_proportion$Year)
all_proportion$Type <- factor(all_proportion$Type, levels=unique(all_proportion$Type))
         
ggplot(all_proportion, aes(x=Year, y=Percent, fill=Type)) + 
  geom_area(colour="black", size=.3, alpha=0.8, position = position_stack(reverse = T)) + 
  scale_x_continuous(breaks=seq(2008,2017,3), limits=c(2008,2017)) + 
  scale_y_continuous(breaks=seq(0,100,10), limits = c(0,100)) + 
  scale_fill_manual(values = c("#F9C7C4", "#ef726c", "#D63F38"), 
                    labels=c("Humanities students", "Other Society and Culture students", "All other students")) + 
  theme(panel.grid.minor = element_blank(), 
        axis.ticks = element_blank()) + 
  labs(y="Students (%)", 
       title="Student population profile", 
       subtitle="Degree-level and higher", 
       caption="Source:educationcounts.govt.nz") + 
  guides(guide_legend(title = NULL), 
         fill = guide_legend(reverse=T))

ggsave("student-profile.png", width = 15, height = 15, units = "cm")

         