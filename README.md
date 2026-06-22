# Does Living with a Partner Affect Financial Risk Tolerance?

Econ 306 Final Project, Spring 2026
Dataset: Survey of Consumer Finance

## Dependent Variable

The dependent variable measures the respondents' willingness to take financial risk for financial decisions. The variable is measured on a 1-4 scale with lower values representing greater willingness to take financial risk.

## Independent Variable of Interest

The independent variable is whether the respondent lives with a partner or not. The analysis attempts to measure the effect that living with a partner has on risk aversion. The regression model includes control variables such as age, employment, and gender.

Sample restriction: respondents ages 25-60.

## Theory

Having and living with a partner likely influences personal mindsets and goals. This mindset likely influences people's risk aversion to become more risk-averse in comparison to someone living without a partner. Financial decisions often impact the entire household, leading to respondents living with a partner behaving more carefully.

Living with a partner may increase personal responsibility, which increases financial responsibility in multiple ways. Living with a partner can lead to coordinating spending and long-term planning. Preparing for the future and what comes with it, such as children, retirement, and home ownership, inherently leads to a financial risk aversion to prioritize the future and avoid large financial losses.

Whereas respondents that don't live with a partner have fewer financial obligations with a much more independent mindset. This independent mindset can be seen in potential financial decisions, as they may be more likely to take risks on investment and variable purchases such as sports cars or fancy watches. This "Bachelor" mindset likely increases financial risk-seeking activities in search of higher returns.

## Hypothesis

Respondents living with a partner are more risk-averse in comparison to respondents not living with a partner.

## Model Specifications

- **Base:** Financial risk = B0 + B1(Partnered) + u
- **Alternate 1:** Financial Risk = B0 + B1(Partnered) + B2(Age) + u
- **Alternate 2 (final):** Financial Risk = B0 + B1(Partnered) + B2(Age) + B3(Employed) + B4(Sex) + u

## Results

| Variable | (1) | (2) | (3) |
|---|---|---|---|
| Partnered | 0.0118 | 0.0363 | 0.122*** |
| Age | | 0.00476*** | 0.00312** |
| Employed | | | -0.274*** |
| Female | | | 0.367*** |
| R² | 0.0000157 | 0.00312 | 0.0574 |
| N | 10,195 | 10,195 | 10,195 |

*t statistics in parentheses; * p<0.05, ** p<0.01, *** p<0.001*

## Discussion of Results

Regression 3 is preferred as it includes all control variables and is the regression that best reduces potential omitted variable bias. Compared to the other regressions, the partnered coefficient of 0.122 increased from the other specification coefficients of 0.0118 and 0.0363. The coefficient becomes statistically significant, and the overall R-squared value increases with the introduction of all control variables. Overall, the preferred specification supports my hypothesis that living with a partner is more risk-averse in comparison to respondents not living with a partner.

Specification 3 reports that respondents living with a partner report an increase of .122 on the financial risk 1-4 scale. This increase actually means living with a partner reduces financial risk seeking by .122 in comparison to living without a partner, as 1 represents higher financial risk seeking and 4 represents higher financial risk aversion. The results suggest respondents living with a partner are more financially timid then respondents living without a partner.

The magnitude of the coefficient is modest because .122 on a 1-4 scale is not a massive difference. Also, the overall R-squared value of 0.0574 suggests that the model can only explain around 5.74% of the variation in financial risk.

## Limitations

Even though my regression analysis included multiple control variables, the marginal effects cannot be interpreted as purely causal. Omitted variable bias may still exist because many omitted characteristics, such as financial education and childhood, influence financial risk tolerance and partner status.

The analysis may also have simultaneous causality, as financial risk can affect relationship decisions. For example, a financially risky person is less likely to enter a long-term, financially cautious relationship. This potential simultaneous causality makes it hard to isolate the effect that living with a partner has on financial risk.

Finally, measurement limitations also limit the analysis, as measuring someone's financial risk through a self-reported financial 1-4 categorical scale is not effective. The respondent may report a certain risk tolerance while exhibiting another; also, there are many more levels of financial risk that cannot be simply measured through 4 categories.

## Files

- `SCF_2022_Project.do` — Stata script: data cleaning, sample restrictions, variable recoding, and all three regression specifications
