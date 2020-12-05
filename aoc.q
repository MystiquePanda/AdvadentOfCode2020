/-"Day 1."
expense_report:{[input] 
 :prd first k where 2020=sum each k:t cross t:"I"$read0 input}

expense_report2:{[input]
 :prd first k where 2020=sum each k:t cross t cross t:"I"$read0 input
 }

/-"Day 2."
password:{[input]
 :sum {l:" " vs ssr[x;":";""];(sum l[2]=first l[1])within "I"$"-" vs l[0]}each read0 input
 }

password2:{[input]
 :sum {l:" " vs ssr[x;":";""];1=sum (first l[1])=l[2] -1+"I"$"-" vs l[0]}each read0 input
 }

/-"Day 3."
slope:{[x;y;t]
  :sum "#"={(x 1) x 0}each flip ((x*til count n) mod count t 0;n:t ti where ct > ti:y*til ct:count t)
  }

tree:{[input]
  :slope[3;1;read0 input];
 }

tree2:{[input]
  m:read0 input;
  :slope[3;1;m]*slope[1;1;m]*slope[5;1;m]*slope[7;1;m]*slope[1;2;m]
 }

/-"Day 4."
scanner:{[input]
  k:`byr`iyr`eyr`hgt`hcl`ecl`pid;
  pspts:{(`$p@\:0)!((p:":" vs ' " " vs " " sv x) @\: 1)} each (0,1+where 0=count each t) cut t:read0 input;
  :pspts where {(count k) = sum k in key x}each pspts;
 }

passport:{[input]
  :count scanner[input]
 }

passport2:{[input]
  k:`byr`iyr`eyr`hgt`hcl`ecl`pid;
  pspts:update "I"$byr,"I"$iyr,"I"$eyr,hgt:"I"$-2_ 'hgt,hgtu:`$-2#'hgt, `$ecl from flip k!flip scanner[input] @\:k;

  :exec count i from pspts where byr within (1920;2002), iyr within (2010;2020), eyr within (2020;2030), ecl in `amb`blu`brn`gry`grn`hzl`oth, 9=count each pid, hcl like ("#",raze 6#enlist "[0-9a-f]"), pid like (raze 9#enlist "[0-9]"), (((hgtu=`in) and hgt within (59;76)) or ((hgtu=`cm) and hgt within (150;193)))
 }
