select
   month(date) as month_name
  ,sum(sal) as total_sal

from
{{ref ('input_dataset')}}
group by 1