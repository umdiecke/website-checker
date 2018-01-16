package de.eitco.wc;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Properties;

/**
 * BGHW Berufsgenossenschaft Handel und Warenlogistik
 *
 * Erstellt 2017 von RHildebrand
 */

/**
 * FIXME RHildebrand JavaDoc
 *
 * @author RHildebrand
 * @version 0.0
 * @since 15.08.2017, 11:05:53
 *
 */
public class WebsiteChecker {

	/**
	 * FIXME RHildebrand JavaDoc
	 *
	 * @param urlString
	 * @return
	 * @throws IOException
	 */
	public static boolean urlExists(final String urlString) throws IOException {
		InputStream is = null;
		try {
			URL url = new URL(urlString);
			URLConnection con = url.openConnection();

			is = con.getInputStream();
			return true;
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
				}
			}
		}
	}

	/**
	 * FIXME RHildebrand JavaDoc
	 *
	 * @return
	 */
	public static Properties getUrls() {
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();

		Properties urls = new Properties();
		try (InputStream input = classLoader.getResourceAsStream("sites.properties")) {
			urls.load(input);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return urls;
	}

	/**
	 * FIXME RHildebrand JavaDoc
	 *
	 * @return
	 */
	public static boolean getAddUrl(final String url) {
		boolean result = false;

		return result;
	}

}
