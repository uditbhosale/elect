import java.io.IOException;
import java.nio.file.*;

public class FileMonitor {

    public static void main(String[] args) {
        String folderPath = "Elect"; // Replace with the actual path to the shared folder

        try {
            WatchService watchService = FileSystems.getDefault().newWatchService();
            Path path = Paths.get(folderPath);
            path.register(watchService, StandardWatchEventKinds.ENTRY_DELETE);

            while (true) {
                WatchKey key;
                try {
                    key = watchService.take();
                } catch (InterruptedException e) {
                    return;
                }

                for (WatchEvent<?> event : key.pollEvents()) {
                    if (event.kind() == StandardWatchEventKinds.ENTRY_DELETE) {
                        Path deletedFile = (Path) event.context();
                        if (deletedFile.toString().equals("License.txt")) {
                            System.out.println("License.txt was deleted. Taking action...");
                            // Implement action here, such as deleting other files
                            // Be extremely cautious about performing any action on files without consent
                        }
                    }
                }

                key.reset();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
