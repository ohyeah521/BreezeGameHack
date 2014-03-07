#import <substrate.h>
#import <substrate2.h>
int (*old_getscore)(void* self, int amount);
int (*old_getcoin)(void* self, int amount);
int getscore(void * self,int amount){
old_getscore(self,999999);
}

getcoin getcoin(void * self,int amount){
old_getcoin(self,2000);
}

__attribute__((constructor))
void Init()
{
MSHookFunction(((void*)MSFindSymbol(NULL, "__ZN10BreezeGame8GameData13CalFinalScoreEv")),(void*)getscore, (void**)&old_getscore);
MSHookFunction(((void*)MSFindSymbol(NULL, "__ZN10BreezeGame8GameData14StCoinAdditionEj")),(void*)getcoin, (void**)&old_getcoin);
}


/* 
 
00ea510 T __ZN10BreezeGame8GameData12StRebornInfoEj

000e8aac T __ZN10BreezeGame8GameData13CalFinalScoreEv
000ea718 T __ZN10BreezeGame8GameData13StPropUseTimeERKNS_9PropsTypeERKfb
000e8e48 T __ZN10BreezeGame8GameData14AddScoreByCoinEjb

000ea160 T 

000e9310 T __ZN10BreezeGame8GameData15GetLuckyGoldAddEv
000e89ec T __ZN10BreezeGame8GameData15InitDeadTypeMapEv
000ea180 T __ZN10BreezeGame8GameData15StScoreAdditionEj

000ea46c T __ZN10BreezeGame8GameData17GetCurrentPetTypeEv


000ea4d0 T __ZN10BreezeGame8GameData18GetLuckyFlyStarAddEv

000ea41c T __ZN10BreezeGame8GameData20GetLuckyMonsterTimesEv

000e9480 T __ZN10BreezeGame8GameData21GetLuckyScoreAdditionEv

000e90e4 T __ZN10BreezeGame8GameData7GetGoldEj
000e8b38 T __ZN10BreezeGame8GameData8AddScoreERKNS_9ScoreDataENS_9ScoreTypeEi
000ea444 T __ZNK10BreezeGame8GameData14GetLuckPetTypeEv
000e9548 T __ZNK10BreezeGame8GameData21GetDistanceScoreParamEj


*/
