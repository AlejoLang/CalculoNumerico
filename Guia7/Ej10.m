addpath(pwd)
addpath("../utils")

Q = @(t, z) [z(2);
             -sin(z(1))];

Q0_1 = [0; 1];
Q0_2 = [0, 1.99];
Q0_3 = [0; 2];
Q0_4 = [0; 2.01];
inter = [0 20];
h = 0.01;
L = (inter(2) - inter(1)) / h;

[t1, y1] = rk4(Q, inter, Q0_1, L);
[t2, y2] = rk4(Q, inter, Q0_2, L);
[t3, y3] = rk4(Q, inter, Q0_3, L);
[t4, y4] = rk4(Q, inter, Q0_4, L);

plot(t1, y1(:,1))
hold on
plot(t2, y2(:,1))
hold on
plot(t3, y3(:,1))
hold on 
plot(t4, y4(:,1))
legend("q0=0.1", "q0=0..7", "q0=3", "q0=3.5")
pause