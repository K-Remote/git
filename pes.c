
#include <stdio.h>
int main(void){
    //発電機の台数
    int num = 3;
    //燃料費特性の係数
    double a[]={14, 30, 40};
    double b[]={1000, 3500, 2000};
    // double c[]={560000, 675000, 300000};//ラムダ計算には不要
    //発電量の制約
    double Pi_min[]={20, 50, 20};
    double Pi_max[]={220, 150, 40};
    //補助変数
    double sigma_b_2a=0;
    double sigma_1_2a=0;
    double lambda;
    double fix[]={0, 0, 0};//制約に引っかかった時のフラグ
    int end = 1;//終了判定
    int iteration = 1;//繰り返し回数出力用
    //求めるもの
    double Pi[3];
    //設問の条件
    double Pd_all =100;
    double Pd_dash = Pd_all;


    while(end){
        printf("iteration : %d\n", iteration);
        sigma_1_2a = 0; sigma_b_2a = 0;
        
        //ラムダ計算
        for(int i=0; i<num; i++){
            if(fix[i]==0){
                sigma_1_2a += 1/(2*a[i]);
                sigma_b_2a += b[i]/(2*a[i]);
            }
        }
        lambda = (Pd_dash+sigma_b_2a)/sigma_1_2a;
        printf("lambda:%f\n", lambda);
        //需要割当計算
        for(int i=0;i<num;i++){
            if(fix[i]==0){
                Pi[i]=(lambda-b[i])/(2*a[i]);                
            }else{
                Pi[i]=Pi[i];
            }
        }        
        //上下限制約判定
        int satisfy = 0;
        for(int i=0; i<num; i++){
            printf("G%d:%f", i, Pi[i]);
            if(Pi_min[i]>Pi[i]){
                Pi[i]=Pi_min[i];
                fix[i]=1;
                printf(" < min : error! \n");
            }else if(Pi[i]>Pi_max[i]){
                Pi[i]=Pi_max[i];
                fix[i]=1;       
                printf(" > max : error! \n");
            }else{
                satisfy += 1;
                printf(" : OK \n");
            }
            if(satisfy==3){
                end = 0;
            }         
        }   
        //再計算時　P_dの再設定
        Pd_dash = Pd_all;
        for(int i=0;i<num;i++){
            Pd_dash -= Pi[i]*fix[i];
        }    
    
    iteration ++;
    printf("\n");
} //繰返終了
    
    //結果を出力
    printf("Final Resul demand=%f\n", Pd_all);
    for(int i=0; i<num; i++){
        printf("G%d:%f\n", i, Pi[i]);
    }
}
    
    
