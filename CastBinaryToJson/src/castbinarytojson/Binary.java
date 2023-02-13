package castbinarytojson;

public class Binary {

    public static String getBinaryContentAsString(Object param) {
        byte[] bytes = (byte[]) param;
        String content = new String(bytes);
        return content;
    }

    public Binary() {
        super();
    }
}
