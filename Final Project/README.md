## 22-2 ESC Final Project Guideline 🗂

### 1. Goal
- Interpreting model in Bayesian perspective
- 예측보다는, "해석"이 주 목적
- Bayesian model의 예측력은 다른 black box model에 비해 떨어질 수 있습니다. 하지만 우린 Bayesian model을 통해 회귀 계수를 얻는 과정을 설명할 수 있고 결과로서 얻은 회귀 계수의 확률 분포를 알 수 있습니다. 따라서 우린 Bayesian model을 통해 얻은 결과를 black box model보다 더 잘 설명할 수 있고 해석할 수 있습니다. 이번 파이널 프로젝트에서 여러분들이 Bayesian model을 이용하여 데이터 분석을 해보고 분석 결과를 해석하고 설명하는데 초점을 맞춰 프로젝트를 진행해보길 바랍니다.
- 추가적으로 여력이 된다면 frequentist 관점에서 데이터 분석을 진행하여 결과를 비교해보고 추론 방법 간의 장단점, 해석의 차이를 알아보는 것도 추천드립니다.

### 2. Datasets
\* 아래에 제시된 데이터셋 외에 다른 데이터셋을 사용하셔도 무방합니다!

#### Regression Problem

\- **[DACON] 아파트 실거래가 예측**
 - 서울/부산 지역 아파트 실 거래가를 예측하는 모델 개발
 - 서울/부산 지역의 1,100,000여개 거래 데이터, 아파트 거래일, 지역, 전용면적, 실 거래가 등의 정보
 - 서울/부산 지역의 공원, 어린이집에 대한 데이터 포함
 - train data가 크므로 일부만 사용해도 될 것 같다.
 - 데이터 설명 링크 : https://dacon.io/competitions/official/21265/overview/description


\- **[서울연구원] 서울형 행복지수 data**
 - 서울시민이 생각하는 행복에 대한 인식 및 영향을 끼치는 요소 파악, 현재 행복도 예측
 - 데이터 설명 링크 : https://data.si.re.kr/si-survey/441


#### Classification Problem (Binary Response - Logistic Regression / GLM)
\- **[UCI] Polish companies bankruptcy data**
 - 회사의 금융지표를 이용하여 2년 뒤 회사의 파산 여부를 예측
 - *불균형 데이터
 - 데이터 설명 링크 : https://archive.ics.uci.edu/ml/datasets/Polish+companies+bankruptcy+data
 - 참고 : ESC 21 FALL final project


#### Regression or Classification Problem (Logistic Regression / GLM)
\- **[UCI] Drug assumption data**
 - 인구통계학적 정보와 성격적 지표를 가지고 약물 중독 정도 혹은 여부 예측
 - 약물 중독 정도에 score를 부여하여 regression problem으로 만들거나 일곱 범주의 약물 중독 정도 classification 혹은 "Never Used", "Used over a Decade Ago"를 0으로 놓고 나머지 범주를 1로 놓아 약물 중독 여부 예측
 - 데이터 설명 링크 : https://archive.ics.uci.edu/ml/datasets/Drug+consumption+%28quantified%29
 - 참고 : ESC 21 FALL final project


### 3. Workflow
- **Choosing Dataset** : 데이터셋 중 하나를 선택합니다. 꼭 주어진 데이터를 선택하지 않아도 됩니다. 제시된 데이터셋이 아닌 새로운 데이터를 사용하거나, 제공된 데이터의 예측 변수를 다른 변수로 정의하거나, 추가로 데이터를 붙여서 분석을 하는 것 모두 좋습니다.
- **Pre-Processing** : 데이터의 특성상 전처리가 필요한 경우가 있습니다. 예를 들어, 시계열 변수가 포함되어 있거나, 범주형 변수를 numeric하게 코딩하기, NA imputation 등이 있을 수 있습니다. 또한 데이터의 분포와 단위 차이를 모두 고려하여 적절하게 변환 및 스케일링을 해야 합니다. 모든 변수의 분포가 같을 필요는 없지만, 같은 단위에 있는 것이 바람직합니다. 

고려해볼 사항: 결측치 처리(어떻게?), 범주형 변수 숫자로 표현하기, 변수 변환(log transformation, box-cox transformation. 필요하다면 왜 해줘야하는 걸까요?), 변수 scaling(minmax scaling, standardization. 필요하다면 왜 해줘야 하는 걸까요?)
- **Feature Extraction** : 여러 변수를 합쳐서 새로운 변수를 만들거나, 외부 데이터에서 얻은 변수로 새로운 feature를 추가하거나, correlation analysis 등을 통해 multicolinearity가 있는 변수를 분석에서 제외하는 등의 작업입니다. 변수들끼리 상관관계가 높은 경우 단순히 삭제를 할 수도 있고, 잠재변수를 바탕으로 새로운 변수를 만들 수도 있습니다.
- **EDA+Visualization** : EDA는 Pre-Processing과 Feature Extraction과 병행하여 데이터에 대해 알아갑니다. 기본적인 기술통계량이나 skewness를 보거나, normal assumption을 적용할 수 있는지, 변수 재정의가 필요하지는 않은지 파악합니다. 또한, 데이터의 분포를 눈으로 파악하는 것이 직관을 줄 수 있습니다. 설명변수와 반응변수 간, 혹은 설명변수 간의 산점도를 그려 선형/비선형 관계를 파악하거나, 데이터 이해에 도움이 되는 시각화를 해봅니다.

- **Modeling** : Bayesian Linear Regression을 통해서 학습을 진행합니다. 여력이 된다면 frequentist 방법으로도 학습을 진행합니다(OLS,NN,tree model,boosting, etc). 

- **Model Selection** : 모델 셀렉션의 의미는 크게 2 가지입니다. 모델의 CV 에러(Bias - Variance Tradeoff), 모델의 해석 가능 여부 등을 고려합니다.

  1. 모델 자체의 선택: 예컨대 로지스틱 회귀를 쓸지, SVM을 쓸지, Random Forest를 쓸지, 혹은 이 모두를 함께 쓰는 Voting Classifier를 쓸지 결정합니다.
  2. 모델 내 변수의 선택: 어떤 변수를 쓸지, 어떤 잠재변수를 고려할지 등을 결정합니다.

  그렇지만 이번 프로젝트의 경우 크게 linear regression 한 가지 모델을 사용하기 때문에 2번 모델 내 변수의 선택에 해당합니다.

 WEEK1(FCB Ch.9)에 배운 내용을 토대로 Bayesian model selection을 통해서 feature selection을 하여 결과를 비교해보세요. 빈도론적 관점에서 회귀분석을 실시하였다면 forward / backward selection, information criterion 등을 사용하여 model selection을 할 수 있겠고,  두 관점 모두에서 적용 및 해석이 가능한 Lasso / Ridge 등의 penalizing method를 사용할 수도 있습니다.

Bayesian model selection을 할 때 직접 코딩을 통해 구현해도 되고, 패키지나 library를 사용해도 됩니다. 패키지나 library의 경우 R은 BAS 패키지를 사용하면 됩니다. 파이썬의 경우 PyMC라는 패키지가 있습니다. 하지만 PyMC 구글링 결과 prior를 정규분포 외에 g-prior와 같은 분포를 설정할 수 있는지는 잘 모르겠습니다. 그리하여 직접 코딩 시 파이썬 활용, 패키지 사용시 R 사용이 좋지 않을까 개인적으로 생각합니다.

ESC 21 Spring final project에서 선배님들이 직접 코딩과 library 사용 모두 다뤘으므로 참고하시면 더욱 수월하실거라고 생각합니다.

(참고: WEEK1(FCB Ch.9), ESC 21 Spring github repository final project, BAS: https://cran.r-project.org/web/packages/BAS/vignettes/BAS-vignette.html,https://cran.r-project.org/web/packages/BAS/BAS.pdf, 구글링 또 구글링,,,)

- **Interpretation** : Evaluation이 주된 목적은 아니지만 분석 과제에 맞게 metric을 정하고 그를 바탕으로 모델의 성능을 평가합니다. 공모전 데이터처럼 metric이나 평가에 사용하는 score가 정해져 있는 경우도 있고, 단순 MSE를 사용할 수도, binary classification이라면 contingency table을 보는 방법 등이 있습니다. 잘 예측하는 것도 중요하지만 그에 못지않게 모델을 설명할 수 있는 것도 중요합니다. 예를 들어, 어떤 변수가 중요한지 (나아가 왜 중요한지 나름의 해석이 있으면 좋겠죠?), 회귀 계수나 feature selection의 기준이 되는 값을 근거로 제시하고 그 이유를 생각해보면 됩니다.

👩🏻‍💻 **최종 발표 (Week 12 : November 24th)** : 파이널 프로젝트를 수행한 내용을 팀별로 15분 이내로 발표해주세요. Bayesian linear model을 통해 얻은 예측 score 자체는 좋지 않을 수 있습니다. 이번 프로젝트에서는 결과가 좋지 않더라도 왜 좋지 않았을지 생각해본 내용이나 improvement 등을 고민해보시고 발표해주세요. 한 학기동안 배운 내용과 연관지어 결과를 잘 해석하고 모델과 변수를 잘 설명하는 게 중요합니다!

학기중에 빅콘테스트도 진행하고, 대면 학기가 활성화되면서 모두 바쁘고, 생소한 학기였습니다. 이제 이번 학기 마지막 일정인 파이널 프로젝트가 남았습니다. 파이널 프로젝트가 잘 진행될 수도, 잘 진행되지 않을 수도 있습니다. 하지만 결과를 떠나서 데이터를 살펴 보고, 데이터 전처리를 하며, 코드로 구현하고, 나온 결과에 대해 생각해보는 시간들은 여러분들에게 좋은 경험이 될 거라고 생각합니다. 이번 학기 마지막 일정인 파이널 프로젝트, 각자 여력에 맞게 직접 Bayesian 관점에서 데이터 분석을 해보면서 한 학기 공부한 내용을 돌아보셨으면 좋겠습니다. 




