
void setup(){
  size(700,500);
  
}

int x = 170, y = 270 ;
int dx = 1 , dy = 2;

int [][] data_up = new int [10][6];
int [][] data_under = new int [10][6];
int [][] data_right = new int [10][6];
int [][] data_left = new int [10][6];
int [][] data_count = new int [10][6];

int count = 0;

void draw(){
  fill(235);//back screen color
  rect(0,0,700,500);//back screen
  
  stroke(0);
  fill(175);//stick color
  rect(mouseX-50,450,100,20);//stick
  
  fill(255);//ball color
  ellipse(x,y,10,10);//ball
  
  
  fill(0);
  textSize(30);
  text(count,50,450);
  
  
  x = x + dx;
  y = y + dy;
  
  for(int i = 0; i < 10 ; i=i+1){
    for(int j = 0; j <6; j= j + 1){
      if(data_count[i][j] != 1){
      data_count [i][j] = 0;
      
      }
    }
  }
  
  for(int i = 0; i<10 ; i=i+1){
    for(int j = 0; j <6; j= j + 1){
      
      if(data_count [i][j] == 0 ){
        fill(175);//box color
        rect(i*70,j*30+50,70,30);//box
      
        data_up [i][j] = 50+30*j;
        data_under [i][j] = 80+30*j;
        data_left [i][j] = i*70;
        data_right [i][j] = i*70+70;
        
        //count=0;
      }
    }
  }
  
  if(width <= x+10){//right wall
    dx=-2;
    
  }
  
  if(0 >= x-10){//left wall
   dx=2;
   
  }
  
  if(0>=y-10){
    dy=2;
    
  }
  
  if(mouseX - 50 <= x && x <= mouseX - 30 && y + 10 >= 450){//left
    dy = -1;
    dx = -2;
    
  }
  
  if(mouseX - 30 <= x && x <= mouseX - 10 && y + 10 >= 450){//midleft
    dy = -2;
    dx = -1;
    
  }
  
  if(mouseX - 10 <= x && x <= mouseX + 10 && y + 10 >= 450){//mannnaka
    dy = -3;
    dx = 0;
    
  }
  
  if(mouseX + 10 <= x && x <= mouseX + 30 && y + 10 >= 450){//midright
    dy = -2;
    dx = 1;
    
  }
  
  if(mouseX + 30 <= x && x <= mouseX + 50 && y + 10 >= 450){//right
    dy = -1;
    dx = 2;
    
  }
  
  for(int i = 0; i<10 ; i=i+1){
    for(int j = 0; j <6; j= j + 1){
      if((data_under [i][j] >= y-10 && data_left [i][j] <= x && x <= data_right [i][j] && data_count [i][j] == 0) ||
          (data_up[i][j] <= y+10 && data_under[i][j] > y+10 &&  data_left[i][j] <= x && x<= data_right[i][j])||//(ue) ||
          (data_left[i][j] <= x+10 && x+10< data_left[i][j] && data_up[i][j] <= y && y<= data_under[i][j])||//(migi) ||
          (data_right[i][j] >= x - 10 && data_left[i][j] < x-10 && data_up[i][j]<= y && y<=data_under[i][j])//(hidari)
      ){
        if(data_count[i][j]==0){
          
          data_count [i][j] = 1;
          noStroke();
          fill(235);
          rect(data_left [i][j] , data_up [i][j] , 70,30);
          dy= 2;
        
          count=count+1;
        
        }
      }
    }
  }
  
  
  
  
  
  
  
}
