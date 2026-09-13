import boto3
from pathlib import Path

s3 = boto3.client('s3',
    endpoint_url='http://localhost:9000',
    aws_access_key_id='minioadmin',
    aws_secret_access_key='minioadmin123',
    region_name='us-east-1'
)

# bucket public
try:
    s3.create_bucket(Bucket='kingdom-kids-assets')
except: pass

s3.put_bucket_policy(
    Bucket='kingdom-kids-assets',
    Policy='{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":"*","Action":["s3:GetObject"],"Resource":["arn:aws:s3:::kingdom-kids-assets/*"]}]}'
)

for f in Path("assets_to_upload").rglob("*"):
    if f.is_file():
        key = str(f.relative_to("assets_to_upload")).replace("\\","/")
        s3.upload_file(str(f), 'kingdom-kids-assets', key)
        print(f"uploaded {key}")

print("\nTESTE CE LIEN:")
print("http://localhost:9000/kingdom-kids-assets/books/test-arche/images/p01.png")