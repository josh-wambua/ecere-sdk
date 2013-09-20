import "ecere"

public class FindPrime
{
   Array<uint> primeList { [ 2 ], minAllocSize = 64 };
   uint index;

   index = 3;

   bool HasPrimeFactor(int x)
   {
      int max = (int)floor(sqrt((double)x));
     
      for(i : primeList)
      {
         if(i > max) break;
         if(x % i == 0) return true;
      }
      return false;
   }

   public int GetPrime(int x)
   {
      if(x > primeList.count - 1)
      {
         for (; primeList.count != x; index += 2)
            if(!HasPrimeFactor(index))
            {
               if(primeList.count >= primeList.minAllocSize) primeList.minAllocSize *= 2;
               primeList.Add(index);
               //PrintLn(index);
            }
      }
      return primeList[x-1];
   }

   void GapUpTo(int x)
   {
      uint64 loop = 1;
      uint64 num;
      uint64 gap = 0;
      uint64 count = 0;

      for(i : primeList)
      {
         if(i > x)
            break;
         loop *= i;
      }

      PrintLn("loop is every ", loop);
      gap = 1;
      for(num = 2; num < loop + 2; num++)
      {         
         bool found = false;
         for(i : primeList)
         {
            if(i > x)
               break;
            if(num % i == 0)
            {
               gap++;
               found = true;
               break;
            }
         }
         if(found) continue;
         /*if((++count) % 20 == 0)
            f.PrintLn(gap, "");
         else
            f.Print(gap, " ");*/

         gap = 1;
      }
      //f.PrintLn("");
      //PrintLn("Stopped at ", num);
      //PrintLn(x, " : ", count);
   }

   Array<int> GetGapUpTo(int x)
   {
      uint64 loop = 1;
      uint64 num;
      uint64 gap = 0;
      uint64 count = 0;
      Array<int> gaps { };

      for(i : primeList)
      {
         if(i > x)
            break;
         loop *= i;
      }

      gap = 1;
      for(num = 2; num < loop + 2; num++)
      {         
         bool found = false;
         for(i : primeList)
         {
            if(i > x)
               break;
            if(num % i == 0)
            {
               gap++;
               found = true;
               break;
            }
         }
         if(found) continue;
         gaps.Add(gap);

         gap = 1;
      }
      return gaps;
   }

   bool CheckGapUpTo(int n, int x)
   {
      bool valid = true;
      uint64 loop = 1;
      uint64 num;
      uint64 gap = 0;
      uint64 count = 0;

      for(i : primeList)
      {
         if(i > x)
            break;
         loop *= i;
      }

      gap = 1;
      for(num = 2; num < loop + 2; num++)
      {         
         bool found = false;
         for(i : primeList)
         {
            if(i > x)
               break;
            if(num % i == 0)
            {
               gap++;
               found = true;
               if(num == n)
                  valid = false;
               break;
            }
         }
         if(found) continue;

         gap = 1;
      }
      return valid;
   }
}
/*
File f;

class PrimeApp : _Application
{
   FindPrime fp { };
   void Main()
   {
      int num = argc > 1 ? atoi(argv[1]) : 1;
      Time t = GetTime();

      f = FileOpen("E:/sdk/samples/eC/FindPrime/gaps.txt", write);
      
      //fp.GetPrime(1000);

      //PrintLn(fp.GetPrime(5000));
      PrintLn(fp.GetPrime(1000000));
  
      PrintLn("2:");
      fp.GapUpTo(2);
      PrintLn("3:");
      fp.GapUpTo(3);
      PrintLn("5:");
      fp.GapUpTo(5);
      PrintLn("7:");
      fp.GapUpTo(7);
      f.PrintLn("11:");
      fp.GapUpTo(11);
      f.PrintLn("13:");
      fp.GapUpTo(13);
      f.PrintLn("17:");
      fp.GapUpTo(17);
      /*f.PrintLn("19:");
      fp.GapUpTo(19);
      f.PrintLn("23:");
      fp.GapUpTo(23);
      f.PrintLn("29:");
      fp.GapUpTo(29);
      /*f.PrintLn("31:");
      fp.GapUpTo(31);*/
/*      delete f;

      PrintLn("Took ", (double)((GetTime() - t) * 1000), " ms");
      system("pause");
   }
}
   */
