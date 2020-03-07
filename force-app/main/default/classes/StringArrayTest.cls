public class StringArrayTest {

    public static List<String> generateStringArray(Integer n)
    {
        List<String> resultado = new List<String>();
        for(Integer i = 0;i<n;i++)
        {
            resultado.add('Test ' + i);
        }
        return resultado;
    }
}