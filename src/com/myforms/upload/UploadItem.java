package com.myforms.upload;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class UploadItem {
		private Integer documentId;
        private String filename;
        private CommonsMultipartFile fileData;

        public String getFilename() {
                return filename;
        }

        public void setFilename(String filename) {
                this.filename = filename;
        }

        public CommonsMultipartFile getFile() {
                return fileData;
        }

        public void setFile(CommonsMultipartFile fileData) {
                this.fileData = fileData;
        }

		public Integer getDocumentId() {
			return documentId;
		}

		public void setDocumentId(Integer documentId) {
			this.documentId = documentId;
		}
}

